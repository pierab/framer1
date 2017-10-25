# Configuraciones Generales del Device

Device = new DeviceComponent
Device.setupContext()
Device.deviceType="apple-iphone-6s-silver"  # Definimos el tipo de device, en este caso un iPhone 6s plateado

# LAYERS. Seteamos todos los elementos de la interfaz

Canvas = new Layer
	x : 0
	y : 0
	z : 0
	width : 375
	height : 667
	backgroundColor : '#FFFFFF'

## Transformando Hero en una imagen compuesta

Mask = new Layer  # Este es un truco para ocultar imagenes cuando esten bajo el borde de Hero. Este Mask será el contendor de los textos y botón
	parent : Canvas
	x : 0
	y : 240
	z : 1
	width : Canvas.width
	height : Canvas.height
	backgroundColor: '#FFFFFF'

cielo = new Gradient
    start: "#9bffff"
    end: "#5fd6ed"
    angle: 45

#cielo = Color.mix("9bffff", "white", 0.5)
sol= new Gradient
	start: "#fac036"
	end: "FF8000"
	angle: 180

Hero = new Layer
	parent : Canvas
	x : 0
	y : 0
	width : 375
	height : 240
	gradient: cielo

Clouds = new Layer
	parent : Hero
	x : 0
	y : 28
	opacity : 0
	width : 353
	height : 75
	image : 'images/clouds.png'

Sun = new Layer
	parent : Hero
	x : 200
	y : 148
	opacity : 0
	width : 12
	height : 12
	borderRadius : 100
	gradient: sol

Skyline = new Layer
	parent : Hero
	x : -80
	y : 158
	opacity: 0
	width : 374
	height : 166
	image : 'images/skyline.png'

Buildings = new Layer
	parent : Hero
	x : 10
	y : 74
	opacity : 1
	width : 365
	height : 166
	image : 'images/buildings.png'

# Seteamos el content

Title = new TextLayer
	parent : Mask
	fontFamily : 'Roboto'
	x : 30
	y : - 48		# Este valor coloca al Title arriba, fuera del canvas, al igual que el Hero
	opacity : 0							# Este valor oculta al Title bajandole la opacidad al minimo = 0
	width : 315
	text : "Way more than a typical coding school"
	color : '#132E5C'
	fontSize : 30
	fontWeight : 100
	lineHeight : 1.3

Content = new TextLayer
	parent : Mask
	fontFamily : 'Roboto'
	x : -Canvas.width				# Este valor coloca el Content a la izquierda, fuera del canvas
	y : 151
	opacity : 0							# Este valor oculta al Content, bajandole la opacidad al minimo
	width : 315
	text : '''We look for talent where no one else is looking for. We identify young women with high potential, despite their economic limitations, and give them the opportunity to become awesome developers. '''
	color : '#7185A6'
	fontSize : 16
	fontWeight : 400
	lineHeight : 1.8

Button = new Layer
	parent : Mask
	x : 30 + Canvas.width		# Este valor oculta el Button a la derecha, fuera del canvas
	y : 325
	width : 138
	height : 50
	backgroundColor : '#0E77E1'
	borderRadius : 3
	style :
		"border-bottom" : "2px solid #0D62B7"

ButtonText = new TextLayer
	parent : Button
	x : Align.center
	y : Align.center
	scale : 0								# Este valor resetea el scale, es decir, si su tamaño normal es 1.0, aca desaparece
	fontFamily : 'Roboto'
	text : "View More"
	color : '#FFFFFF'
	fontSize : 16
	fontWeight : 800


# ANIMACIONES

Hero.animate	# Animando capa Hero
	x : 0
	y : 0				# Estas son las posiciones finales
	options :
		time : 1											# La animación se hará en  segundos
		curve : Bezier.ease		# Tendra un efecto the damping moderado

# AGREGAR ACA ANIMACIONES PARA EL HERO
Clouds.animate
   x: 28
	 	opacity: 1
			options:
				time: 2
				curve: Bezier.ease

Skyline.animate
	y: 74
	x: 0
	opacity: 1

Sun.animate
	y: 29
	x: 69
	opacity: 1
	width: 92
	height: 92
	time: 10
	options:
		curve: Bezier(0.25, 0.1, 0.25, 1)


# AGREGAR ACA ANIMACIONES PARA EL HERO
Title.animate
	x : 30
	y : 48
	opacity : 1		# Esta la opacidad final, el objeto aparece
	options :
		time : 2
		curve : Spring(damping: 0.5)
		delay : 0.25										# La animación esperará 0.25 segundos en empezar

Content.animate
	x : 30
	y : 151
	opacity : 1
	options :
		time : 0.5
		curve : Bezier.ease
		delay : 0.75

Button.animate
	x : 30
	y : 325
	options :
		time : 0.5
		curve : Bezier.ease
		delay : 0.75

ButtonText.animate
	x : Align.center
	y : Align.center
	scale : 1					# Con este valor, el objeto recupera su tamaño normal
	options :
		time : 1
		curve : Spring(damping: 0.5)
		delay : 1.25
