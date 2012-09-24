# compatible with ruby 1.8, 1.9, and jruby
require 'rubygems'
require 'osc-ruby'
require 'osc-ruby/em_server'

def random_coords(id)
  x = (rand() - 0.5) * 8
  y = (rand() - 0.5) * 8
  @client.send( OSC::Message.new( "/rect/#{id}/x" , x ))
  @client.send( OSC::Message.new( "/rect/#{id}/y" , y ))
end

def random_colour(id)
  red = rand() * 4
  green = rand() * 4
  blue = rand() * 4
  alpha = rand()
  @client.send( OSC::Message.new( "/rect/#{id}/red" , red ))
  @client.send( OSC::Message.new( "/rect/#{id}/green" , green ))
  @client.send( OSC::Message.new( "/rect/#{id}/blue" , blue ))
  @client.send( OSC::Message.new( "/rect/#{id}/alpha" , alpha ))
end

def random_size(id)
  width = rand() * 3
  height = rand() * 3
  @client.send( OSC::Message.new( "/rect/#{id}/width" , width ))
  @client.send( OSC::Message.new( "/rect/#{id}/height" , height ))
end

def move_to_random_position(id, speed)
  # speed: time in milliseconds to take to move to this position
  x = (rand() - 0.5) * 16
  y = (rand() - 0.5) * 16
  @client.send( OSC::Message.new("/rect/#{id}/moveTo", x, y, speed) )
end

def colour_to_random(id, speed)
  red = rand()
  green = rand()
  blue = rand()
  alpha = rand()
  @client.send( OSC::Message.new("/rect/#{id}/colourTo", red, green, blue, alpha, speed) )
end

def size_to_random(id, speed)
  width = rand() * 3
  height = rand() * 3
  @client.send( OSC::Message.new( "/rect/#{id}/sizeTo", width, height, speed ))
end

#@server = OSC::EMServer.new( 3333 )
@client = OSC::Client.new( '10.2.1.133', 7220 ) #10.2.1.133 = DJ Localhost

#@server.add_method '/greeting' do | message |
#  puts "Received #{message.to_a}"
#end

#Thread.new do
#  @server.run
#end

@client.send( OSC::Message.new( "/rect/0/x" , 0.1 ))
@client.send( OSC::Message.new( "/rect/0/y" , 0.3 ))
sleep(1)
@client.send( OSC::Message.new( "/greeting" , "another hullo!" ))


interval = 3
while(1)
  sleep interval
  move_to_random_position(0, interval * 1000)
  colour_to_random(0, interval * 1000)
  size_to_random(0, interval * rand() * 500)
  #random_size(0)

  move_to_random_position(1, interval * 1000)
  colour_to_random(1, interval * 1000)
  #random_size(1)

  move_to_random_position(2, interval * 1000)
  colour_to_random(2, interval * 1000)
  #random_size(2)

  move_to_random_position(3, interval * 1000)
  colour_to_random(3, interval * 1000)
  #random_size(3)
end

