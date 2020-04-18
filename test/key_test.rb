require './test/test_helper'
require './lib/key.rb'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("01234")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end
end
