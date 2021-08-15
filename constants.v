module crayon

const (
	prefix    = '\x1b['
	suffix    = 'm'
	reset     = '${prefix}0$suffix'
	fg_colors = {
		'black':         30
		'red':           31
		'green':         32
		'yellow':        33
		'blue':          34
		'magenta':       35
		'cyan':          36
		'light_gray':    37
		'custom':        38
		'default':       39
		'dark_gray':     90
		'light_red':     91
		'light_green':   92
		'light_yellow':  93
		'light_blue':    94
		'light_magenta': 95
		'light_cyan':    96
		'white':         97
	}
	bg_colors = {
		'black':         40
		'red':           41
		'green':         42
		'yellow':        44
		'blue':          44
		'magenta':       45
		'cyan':          46
		'light_gray':    47
		'custom':        48
		'default':       49
		'dark_gray':     100
		'light_red':     101
		'light_green':   102
		'light_yellow':  103
		'light_blue':    104
		'light_magenta': 105
		'light_cyan':    106
		'white':         107
	}
	style = {
		'bold':          1
		'dim':           2
		'italic':        3 // Not widely supported
		'underline':     4
		'slow_blink':    5
		'rapid_blink':   6
		'reverse':       7
		'hidden':        8
		'strikethrough': 9 // Not widely supported
	}
)
