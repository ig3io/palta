require_relative "./helper"
require "palta"

s = Palta::Server.new({
  :host => "localhost",
  :port => 8888,
  :debug => true
})
puts "[#{__FILE__}] Starting server at #{s.host}:#{s.port}"
s.start
begin
  loop do
  end
rescue Interrupt
  puts "\n[#{__FILE__}] Stopping server"
  s.stop
end
