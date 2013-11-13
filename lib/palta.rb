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
      @max_threads = options[:max_threads] || 8
      @threads = []
    end

    def actions &block
      instance_eval(&block) if block_given?
    end

    def on_msg msg
      send("on_#{msg[:type]}", msg)
    end

    def start
      @max_threads.times do |i|
        @threads << Thread.new do
          sleep 1
          puts "thread #{i}: hola"
          # TODO actual socket reading code
        end
      end
    end

    def stop
      @threads.each do |t|
        Thread.kill(t)
      end
    end

  end

end
