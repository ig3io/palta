require_relative "./test_helper"
require "test/unit"
require "palta"

class TestServerClient < Test::Unit::TestCase

  def setup
    @s = Palta::Server.new
    @c = Palta::Client.new
    @s.actions do
      def on_test
        # nothing
      end
    end
    @s.start
  end

  def test_message_triggers_action
    @c.send({
      :type => "test",
      :data => "this is a test"
    })
    sleep 0.5 # to give the server thread the chance to run
    assert_equal 1, @s.msg_recv
  end

  def teardown
    @s.stop
  end

end
