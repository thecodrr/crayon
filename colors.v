module crayon

pub fn (c Crayon) bg_black() Crayon {
	return c.bg_colorize('black')
}

pub fn (c Crayon) bg_red() Crayon {
	return c.bg_colorize('red')
}

pub fn (c Crayon) bg_green() Crayon {
	return c.bg_colorize('green')
}

pub fn (c Crayon) bg_yellow() Crayon {
	return c.bg_colorize('yellow')
}

pub fn (c Crayon) bg_blue() Crayon {
	return c.bg_colorize('blue')
}

pub fn (c Crayon) bg_magenta() Crayon {
	return c.bg_colorize('magenta')
}

pub fn (c Crayon) bg_cyan() Crayon {
	return c.bg_colorize('cyan')
}

pub fn (c Crayon) bg_light_gray() Crayon {
	return c.bg_colorize('light_gray')
}

pub fn (c Crayon) bg_dark_gray() Crayon {
	return c.bg_colorize('dark_gray')
}

pub fn (c Crayon) bg_light_red() Crayon {
	return c.bg_colorize('light_red')
}

pub fn (c Crayon) bg_light_green() Crayon {
	return c.bg_colorize('light_green')
}

pub fn (c Crayon) bg_light_yellow() Crayon {
	return c.bg_colorize('light_yellow')
}

pub fn (c Crayon) bg_light_blue() Crayon {
	return c.bg_colorize('light_blue')
}

pub fn (c Crayon) bg_light_magenta() Crayon {
	return c.bg_colorize('light_magenta')
}

pub fn (c Crayon) bg_light_cyan() Crayon {
	return c.bg_colorize('light_cyan')
}

pub fn (c Crayon) bg_white() Crayon {
	return c.bg_colorize('white')
}

pub fn (c Crayon) bg_rgb(r int, g int, b int) Crayon {
	rgb := r.str() + ';' + g.str() + ';' + b.str()
	return Crayon{
		...c
		bg: bg_colors['custom'].str() + ';2;$rgb'
	}
}

// Foreground Colors
pub fn (c Crayon) black() Crayon {
	return c.colorize('black')
}

pub fn (c Crayon) red() Crayon {
	return c.colorize('red')
}

pub fn (c Crayon) green() Crayon {
	return c.colorize('green')
}

pub fn (c Crayon) yellow() Crayon {
	return c.colorize('yellow')
}

pub fn (c Crayon) blue() Crayon {
	return c.colorize('blue')
}

pub fn (c Crayon) magenta() Crayon {
	return c.colorize('magenta')
}

pub fn (c Crayon) cyan() Crayon {
	return c.colorize('cyan')
}

pub fn (c Crayon) light_gray() Crayon {
	return c.colorize('light_gray')
}

pub fn (c Crayon) dark_gray() Crayon {
	return c.colorize('dark_gray')
}

pub fn (c Crayon) light_red() Crayon {
	return c.colorize('light_red')
}

pub fn (c Crayon) light_green() Crayon {
	return c.colorize('light_green')
}

pub fn (c Crayon) light_yellow() Crayon {
	return c.colorize('light_yellow')
}

pub fn (c Crayon) light_blue() Crayon {
	return c.colorize('light_blue')
}

pub fn (c Crayon) light_magenta() Crayon {
	return c.colorize('light_magenta')
}

pub fn (c Crayon) light_cyan() Crayon {
	return c.colorize('light_cyan')
}

pub fn (c Crayon) white() Crayon {
	return c.colorize('white')
}

pub fn (c Crayon) rgb(r int, g int, b int) Crayon {
	rgb := r.str() + ';' + g.str() + ';' + b.str()
	return Crayon{
		...c
		fg: fg_colors['custom'].str() + ';2;$rgb'
	}
}
