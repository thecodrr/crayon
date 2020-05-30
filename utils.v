module crayon

fn (c &Crayon) colorize(color string) &Crayon {
	mut cray := c
	cray.fg = fg_colors[color].str()
	return &cray
}

fn (c &Crayon) bg_colorize(color string) &Crayon {
	mut cray := c
	cray.bg = bg_colors[color].str()
	return &cray
}

fn (c &Crayon) stylize(s string) &Crayon {
	mut cray := c
	cray.style << style[s].str()
	return &cray
}

fn arr(args ...string)[]string{
	mut output := []string{}
	for arg in args{
		output << arg
	}
	return output
}
