require "palta/version"

module Palta

  class PaltaError < StandardError
  end

  class Server

    def initialize options = {}
      @host = options[:host] || "localhost"
      @port = options[:port] || 8888
      @debug = options[:debug] || false
      @dir = options[:dir] || "./.palta/data"
    end

    def actions &block
      instance_eval(&block) if block_given?
    end

    def on_msg msg
      send("on_#{msg[:type]}")
    end

  end

end
