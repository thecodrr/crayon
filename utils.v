module crayon

fn (c Crayon) colorize(color string) Crayon {
	return Crayon{
		...c
		fg: fg_colors[color].str()
	}
}

fn (c Crayon) bg_colorize(color string) Crayon {
	return Crayon{
		...c
		bg: bg_colors[color].str()
	}
}

fn (c Crayon) stylize(s string) Crayon {
	mut stl := c.style
	stl << style[s].str()
	return Crayon{
		...c
		style: stl
	}
}
