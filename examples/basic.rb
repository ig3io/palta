require "./palta"

server = Palta::Server.new({
  :debug => true,
  :dir => "./.palta/data",
  :host => "localhost",
  :port => 8888
})

server.actions do
  
  def on_error msg
    puts "on_error: #{msg}" 
  end

  def on_warning msg
    puts "on_warning: #{msg}"
  end

  def on_info msg
    puts "on_info: #{msg}"
  end

end
