module crayon

import term

struct Crayon {
mut:
	text  []string
	bg    string
	fg    string
	style []string
}

/*
Create a new crayon
   @arguments
   `texts` One or more strings that will be styled
   @returns
   a pointer to the newly created Crayon
*/
pub fn new(texts ...string) Crayon {
	if !term.can_show_color_on_stdout() {
		println('Your terminal does not support colors. Please use a terminal that supports escape sequences for the best experience.')
	}
	return Crayon{
		text: texts
	}
}

/*
Get the styled text in string form
   @returns
   a string of styled text
*/
pub fn (c Crayon) str() string {
	// c.text = arr(text)
	styles := c.style.join(';')

	mut params := '\e['
	params += c.bg
	if c.bg.len > 0 && c.fg.len > 0 {
		params += ';'
	}
	params += c.fg
	if c.fg.len > 0 && styles.len > 0 {
		params += ';'
	}
	params += styles
	params += 'm'

	format := '$params{text}'
	mut output := []string{}
	for i, text in c.text {
		if text.starts_with('\e') {
			output << reset
			output << text
			if i < c.text.len - 1 {
				output << params
			}
		} else {
			output << format.replace('{text}', text)
		}
	}
	return output.join('') + reset
}

/*
Strips the styled text of all the styles
   @returns
   the stripped text
*/
pub fn (c Crayon) strip() string {
	return strip_text(c.text.join(' '))
}

/*
Get the real length of the styled string
   @returns
   the length
*/
pub fn (c Crayon) len() int {
	return c.strip().len
}

/*
Print the styled text
   @arguments
   `texts` is one or more strings that will be printed after the styled text
   @usage
   `crayon.new("hello").cyan().bold().print_with("I come after", "I come even after that")`
*/
pub fn (c Crayon) print() {
	c.print_with('')
}

/*
Print the styled text with additional unformatted/unstyled text
   @arguments
   `texts` is one or more strings that will be printed after the styled text
   @usage
   `crayon.new("hello").cyan().bold().print_with("I come after", "I come even after that")`
*/
pub fn (c Crayon) print_with(texts ...string) {
	if texts.len > 0 {
		text_joined := texts.join(' ')
		println(c.str() + ' ' + text_joined)
	} else {
		println(c.str())
	}
}

/*
Style the text according to the templated styles inside the given text.
   @arguments
   `text` is a templated string that is to be styled
   @returns
   a string that contains the styled string
   @usage
   `crayon.it('{bold.cyan make this bold & cyan}')`
*/
pub fn color(text string) string {
	return parse(text, -1)
}

/*
Strip the styles from a text (Globally available)
   @arguments
   `text` is a templated string that is to be stripped
   @returns
   a stripped string
*/
pub fn strip_text(text string) string {
	start_index := text.index('\e[') or { return text }
	end_index := text.index_after('m', start_index) + 1

	if start_index >= 0 && end_index >= 0 {
		return strip_text(text.replace(text[start_index..end_index], ''))
	}
	return text
}
