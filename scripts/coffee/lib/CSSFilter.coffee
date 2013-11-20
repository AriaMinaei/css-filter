blur = require './filter/blur'
brightness = require './filter/brightness'
contrast = require './filter/contrast'
grayscale = require './filter/grayscale'
hueRotate = require './filter/hueRotate'
invert = require './filter/invert'
opacity = require './filter/opacity'
saturate = require './filter/saturate'
sepia = require './filter/sepia'

filters =

	blur: blur
	brightness: brightness
	contrast: contrast
	grayscale: grayscale
	hueRotate: hueRotate
	invert: invert
	opacity: opacity
	saturate: saturate
	sepia: sepia

# Remember that filters are only supported on some ports of webkit,
# and my testing on Chrome/Win showed that they give a harder hit than
# transforms or opacity.
module.exports = class CSSFilter

	constructor: ->

		@_filters = {}

	setBlur: (d) ->

		@_filters.blur = d

		@

	setBrightness: (d) ->

		@_filters.brightness = d

		@

	setContrast: (d) ->

		@_filters.contrast = d

		@

	setGrayscale: (d) ->

		@_filters.grayscale = d

		@

	rotateHue: (d) ->

		@_filters.hueRotate = d

		@

	invertColors: (d) ->

		@_filters.invert = d

		@

	setOpacity: (d) ->

		@_filters.opacity = d

		@

	setSaturation: (d) ->

		@_filters.saturate = d

		@

	setSepia: (d) ->

		@_filters.sepia = d

		@

	toCss: ->

		str = ''

		for key, value of @_filters

			str += filters[key].toCss(value) + ' '

		str