# Palta

Simple server for simple (remote) logging. Right now it's just an experimental work in progress.

It receives messages and triggers actions.

The criteria should be fully customizable and it should be able to work via TCP and UDP (HTTP too?).

## Usage

```ruby
require "palta"

server = Palta::Server.new

server.actions do

  def on_info msg
    puts "relax: #{msg}"
  end

  def on_warning msg
    puts "just saying: #{msg}"
  end

  def on_error msg
    puts "oops: #{msg}"
  end

end

server.start
```
