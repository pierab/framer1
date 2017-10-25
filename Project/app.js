var Buildings, Button, ButtonText, Canvas, Clouds, Content, Device, Hero, Mask, Skyline, Sun, Title, cielo, sol;

Device = new DeviceComponent;

Device.setupContext();

Device.deviceType = "apple-iphone-6s-silver";

Canvas = new Layer({
  x: 0,
  y: 0,
  z: 0,
  width: 375,
  height: 667,
  backgroundColor: '#FFFFFF'
});

Mask = new Layer({
  parent: Canvas,
  x: 0,
  y: 240,
  z: 1,
  width: Canvas.width,
  height: Canvas.height,
  backgroundColor: '#FFFFFF'
});

cielo = new Gradient({
  start: "#9bffff",
  end: "#5fd6ed",
  angle: 45
});

sol = new Gradient({
  start: "#fac036",
  end: "FF8000",
  angle: 180
});

Hero = new Layer({
  parent: Canvas,
  x: 0,
  y: 0,
  width: 375,
  height: 240,
  gradient: cielo
});

Clouds = new Layer({
  parent: Hero,
  x: 0,
  y: 28,
  opacity: 0,
  width: 353,
  height: 75,
  image: 'images/clouds.png'
});

Sun = new Layer({
  parent: Hero,
  x: 200,
  y: 148,
  opacity: 0,
  width: 12,
  height: 12,
  borderRadius: 100,
  gradient: sol
});

Skyline = new Layer({
  parent: Hero,
  x: -80,
  y: 158,
  opacity: 0,
  width: 374,
  height: 166,
  image: 'images/skyline.png'
});

Buildings = new Layer({
  parent: Hero,
  x: 10,
  y: 74,
  opacity: 1,
  width: 365,
  height: 166,
  image: 'images/buildings.png'
});

Title = new TextLayer({
  parent: Mask,
  fontFamily: 'Roboto',
  x: 30,
  y: -48,
  opacity: 0,
  width: 315,
  text: "Way more than a typical coding school",
  color: '#132E5C',
  fontSize: 30,
  fontWeight: 100,
  lineHeight: 1.3
});

Content = new TextLayer({
  parent: Mask,
  fontFamily: 'Roboto',
  x: -Canvas.width,
  y: 151,
  opacity: 0,
  width: 315,
  text: 'We look for talent where no one else is looking for. We identify young women with high potential, despite their economic limitations, and give them the opportunity to become awesome developers. ',
  color: '#7185A6',
  fontSize: 16,
  fontWeight: 400,
  lineHeight: 1.8
});

Button = new Layer({
  parent: Mask,
  x: 30 + Canvas.width,
  y: 325,
  width: 138,
  height: 50,
  backgroundColor: '#0E77E1',
  borderRadius: 3,
  style: {
    "border-bottom": "2px solid #0D62B7"
  }
});

ButtonText = new TextLayer({
  parent: Button,
  x: Align.center,
  y: Align.center,
  scale: 0,
  fontFamily: 'Roboto',
  text: "View More",
  color: '#FFFFFF',
  fontSize: 16,
  fontWeight: 800
});

Hero.animate({
  x: 0,
  y: 0,
  options: {
    time: 1,
    curve: Bezier.ease
  }
});

Clouds.animate({
  x: 28,
  opacity: 1,
  options: {
    time: 2,
    curve: Bezier.ease
  }
});

Skyline.animate({
  y: 74,
  x: 0,
  opacity: 1
});

Sun.animate({
  y: 29,
  x: 69,
  opacity: 1,
  width: 92,
  height: 92,
  time: 10,
  options: {
    curve: Bezier(0.25, 0.1, 0.25, 1)
  }
});

Title.animate({
  x: 30,
  y: 48,
  opacity: 1,
  options: {
    time: 2,
    curve: Spring({
      damping: 0.5
    }),
    delay: 0.25
  }
});

Content.animate({
  x: 30,
  y: 151,
  opacity: 1,
  options: {
    time: 0.5,
    curve: Bezier.ease,
    delay: 0.75
  }
});

Button.animate({
  x: 30,
  y: 325,
  options: {
    time: 0.5,
    curve: Bezier.ease,
    delay: 0.75
  }
});

ButtonText.animate({
  x: Align.center,
  y: Align.center,
  scale: 1,
  options: {
    time: 1,
    curve: Spring({
      damping: 0.5
    }),
    delay: 1.25
  }
});
