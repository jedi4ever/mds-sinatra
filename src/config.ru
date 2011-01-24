require 'eventmachine'
require 'rack/throttle'
require 'rack/fiber_pool'
require 'thin'
require 'rainbows'

# Necessary to include the current directory 
# as ruby 1.9.x doesn't have current directory in loadpath
require './mds'

# Not compatible with ruby 1.9
# use Rack::Throttle::Interval

use Rack::ShowExceptions

# Hm, maybe not compatible with Unicorn?
#use Rack::FiberPool

# The question is how to start this stuff
# http://stackoverflow.com/questions/2999430/any-success-with-sinatra-working-together-with-eventmachine-websockets

def non_evented()
	
	# Hm, maybe not compatible with Unicorn?
	use Rack::FiberPool
	
	# 1) Non event machine + Unicorn
	# Start the application
	#run Mds.new
end

#run Mds.new

def non_evented_unicorn()
	# 1) Non event machine + Unicorn
	# Start the application
	run Mds.new
end

	# Hm, maybe not compatible with Unicorn?
	#use Rack::FiberPool
	
	# 2) Event machine (thin, rainbows)
	# Use this block for thin
#EventMachine.run do 
			#Mds.run!()  
			#Mds.run!({:port => 8080})  
#end

run Mds.new
