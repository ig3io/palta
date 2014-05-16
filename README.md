# Palta

[![Build Status](https://travis-ci.org/iconpin/palta.png?branch=master)](https://travis-ci.org/iconpin/palta)

Simple server for simple (remote) logging. Right now it's just an experimental work in progress.

It receives messages and triggers actions.

The criteria should be fully customizable and it should be able to work via TCP and UDP (HTTP too?).

## Planned Usage

It's *planned*, it means *not implemented*. ;\*

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
