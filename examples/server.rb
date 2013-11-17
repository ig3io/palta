require "./helper"
require "palta"

s = Palta::Server.new({
  :host => "localhost",
  :port => 8888,
  :debug => true
})
puts "[test] Starting server at #{s.host}:#{s.port}"
s.start
begin
  loop do
  end
rescue Interrupt
  puts "\n[test] Stopping server"
  s.stop
end
