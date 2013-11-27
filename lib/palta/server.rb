require "palta/core"
require "socket"
require "json"

module Palta

  class Server

    attr_reader :host, :port, :debug, :dir, :max_threads, :msg_recv

    def initialize options = {}
      @host = options[:host] || "localhost"
      @port = options[:port] || 8888
      @debug = options[:debug] || options[:verbose] || false
      @dir = options[:dir] || "./.palta/data"
      @max_threads = options[:max_threads] || 8
      @threads = []
      @msg_recv = 0
    end

    def actions &block
      instance_eval(&block) if block_given?
    end

    def on_msg msg
      @msg_recv += 1
      on_any(msg)
      send("on_#{msg[:type]}", msg)
    end

    def on_any msg
      # nothing
    end

    def start
      @server = TCPServer.new @host, @port
      @max_threads.times do |i|
        @threads << Thread.new do
          loop do
            client = @server.accept
            data = client.recv(1024)
            client.close
            puts "[Palta::Server] thread #{i} recv: #{data}" if @debug
            msg = JSON.parse(data, :symbolize_names => true)
            on_msg(msg)
          end
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
