module crayon

import strconv

fn parse(text string, index int) string {
	start_index := text.index_after('{', index)
	mut end_index := text.index_after('}', start_index)
	if start_index >= 0 && end_index > 0 {
		count := num_of_chars(text[end_index..text.len], `}`)
		if count > 1 {
			end_index += count - 1
		}

		template := text[start_index + 1..end_index]
		if template.len <= 0 {
			return parse(text, end_index) // Move on
		}
		template_index := template.index(' ') or { return text }
		styles := template[0..template_index].split('.')
		str := template[template_index + 1..template.len]

		mut c := new(str)
		fg := fg_colors.keys()
		bg := bg_colors.keys()
		st := style.keys()
		for _, s in styles {
			if s in fg {
				c = c.colorize(s)
			} else if s in bg {
				c = c.bg_colorize(s)
			} else if s in st {
				c = c.stylize(s)
			} else if s.starts_with('rgb(') || s.starts_with('bg_rgb(') {
				paren_index := s.index('(') or { break }
				tag := s[0..paren_index]
				r, g, b := parse_rgb(s, tag)
				if r < 0 || g < 0 || b < 0 {
					println("Wrong number of arguments in call to '${tag}(int,int,int)'")
					break
				}
				c = if tag == 'rgb' {
					c.rgb(r, g, b)
				} else if tag == 'bg_rgb' {
					c.bg_rgb(r, g, b)
				} else {
					c
				}
			} else {
				// Wrong style
				return text
			}
		}
		next_index := text.last_index(reset) or {
			return parse(text.replace(text[start_index..end_index + 1], c.str()), -1)
		}
		return parse(text.replace(text[start_index..end_index + 1], c.str()), next_index)
	}
	return text
}

fn num_of_chars(text string, c byte) int {
	mut i := 0
	for t in text {
		if t == c {
			i++
		} else {
			break
		}
	}
	return i
}

fn parse_rgb(s string, name string) (int, int, int) {
	clrs := s.replace('${name}(', '').replace(')', '').split(',')
	if clrs.len != 3 {
		return -1, -1, -1
	}
	r := strconv.atoi(clrs[0]) or { 0 }
	g := strconv.atoi(clrs[1]) or { 0 }
	b := strconv.atoi(clrs[2]) or { 0 }
	return r, g, b
}
