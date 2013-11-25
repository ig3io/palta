require "palta/core"
require "socket"
require "json"

module Palta

  class Client

    attr_reader :host, :port

    def initialize host="localhost", port=8888
      @host = host
      @port = port
    end

    def send data
      TCPSocket.open(@host, @port) do |s|
        s.send data.to_json
      end
    end

  end

end
