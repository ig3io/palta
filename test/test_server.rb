require "./test_helper"
require "test/unit"
require "palta"

class TestBasic < Test::Unit::TestCase

  def test_default_creation_yields_no_error
    s = Palta::Server.new
  end

  def test_creation_with_paramaters_ok
    options = {
      :host => "127.0.0.1",
      :port => 9898,
      :debug => true,
      :dir => ".palta-data",
      :max_threads => 16
    }
    s = Palta::Server.new options
    assert_equal options[:host], s.host
    assert_equal options[:port], s.port
    assert_equal options[:debug], s.debug
    assert_equal options[:dir], s.dir
    assert_equal options[:max_threads], s.max_threads
  end

end
