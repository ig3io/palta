#!/usr/bin/env ruby

require 'palta'
require 'optparse'

options = {
  :verbose => false,
  :host => "localhost",
  :port => 8888
}

OptionParser.new do |opts|
  opts.banner = "Usage: palta.rb [options]"

  opts.on("-v", "--verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end

  opts.on("-h", "--host", "Set the address to bind. Defaults to 'localhost'") do |h|
    options[:host] = h
  end

  opts.on("-p", "--port", Integer, "Set the port to run. Defaults to 8888") do |p|
    options[:port] = p
  end
end.parse!

server = Palta::Server.new options
server.start
puts "[palta.rb] Server started!"

begin
  while true do
  end
rescue Interrupt => e
  puts "[palta.rb] Main thread stopped"
end
