require_relative "./test_helper"
require "test/unit"
require "palta"

class TestClient < Test::Unit::TestCase

  def test_default_creation_yields_no_error
    c = Palta::Client.new
  end

  def test_creation_with_paramaters_ok
    c = Palta::Client.new "192.168.0.1", 8989
    assert_equal "192.168.0.1", c.host
    assert_equal 8989, c.port
  end

  def test_with_wrong_host_should_fail_to_send
    c = Palta::Client.new "255.255.255.254"
    assert_raise Errno::ENETUNREACH do
      c.send({ :hola => "hi"})
    end
  end
end
