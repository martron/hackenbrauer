hackenbrauer
============

PureData OSC project for messing around with OpenGL in the office on Hackenbrau nights...

Right now, the project consists of 4 rectangles that anyone can manipulate through the local network using OSC.  There 

Network Specifics:
IP: 10.2.1.190
10.2.1.190

OSC Crash course (in ruby)
@client = OSC::Client.new( '10.2.1.190', 7220 ) #Create a client connection to the pd server

@client.send( OSC::Message.new("/rect/0/x" , 0.1) ) #Send the argument 0.1 to 'rect', number '0', parameter 'x'
@client.send( OSC::Message.new("/rect/3/moveTo", x, y, speed) ) #Send the x, y and speed arguments to the 'moveTo' method on rectangle #3

Basically, the message path denotes what method you want to invoke with any number of arguments following.

The currently supported parameters are:
('#' denotes the 'id' of the rectangle you want to change)

Position:
Designated on the upper left corner of the rectangle, compared to upper left corner of screen.  A bit confusing, but because it's on a 3D coordinate system the middle of the screen is 0,0.  I would keep values between -3 and 3.
/rect/#/x float x
/rect/#/y float y

Size:
Keep between 0 and 6
/rect/#/width float width
/rect/#/height float height

Colour:
Values between 0 and 1
/rect/#/red float red
/rect/#/green float green
/rect/#/blue float blue
/rect/#/alpha float alpha

Supported methods are:
Changes the applicable parameters smoothly over time.  Speed is denoted in milliseconds.
/rect/#/moveTo float x, float y, float speed
/rect/#/colourTo float red, float green, float blue, float speed

