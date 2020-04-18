require './test/test_helper'
require './lib/key.rb'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("01234")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_has_readable_attributes
    assert_equal "01234", @key.number
  end

  def test_can_generate_random_number

    num = @key.generate_random_num

    assert_equal true, num.to_i < 100000
    assert_equal 5, @key.generate_random_num.length
  end

  def test_create_keys
    @key.expects(:generate_random_num).returns("15794")

    expected = {A: 15,
                B: 57,
                C: 79,
                D: 94}

    assert_equal expected, @key.create_keys
  end
end
