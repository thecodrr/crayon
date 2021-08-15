module crayon

pub fn (c Crayon) bold() Crayon {
	return c.stylize('bold')
}

pub fn (c Crayon) dim() Crayon {
	return c.stylize('dim')
}

pub fn (c Crayon) italic() Crayon {
	return c.stylize('italic')
}

pub fn (c Crayon) underline() Crayon {
	return c.stylize('underline')
}

pub fn (c Crayon) slow_blink() Crayon {
	return c.stylize('slow_blink')
}

pub fn (c Crayon) rapid_blink() Crayon {
	return c.stylize('rapid_blink')
}

pub fn (c Crayon) reverse() Crayon {
	return c.stylize('reverse')
}

pub fn (c Crayon) hidden() Crayon {
	return c.stylize('hidden')
}

pub fn (c Crayon) strikethrough() Crayon {
	return c.stylize('strikethrough')
}
