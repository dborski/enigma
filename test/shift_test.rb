require './test/test_helper'
require './lib/shift.rb'

class KeyTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end



  def test_create_keys
    expected = {A: 15,
                B: 57,
                C: 79,
                D: 94}

    assert_equal expected, Shift.create_keys("15794", "041820")
  end



  def test_create_offsets

    expected = {A: 2,
                B: 4,
                C: 0,
                D: 0}

    assert_equal expected, Shift.create_offsets("15794", "041820")
  end

  def test_creates_shift

    expected = {A: 17,
                B: 61,
                C: 79,
                D: 94}

    assert_equal expected, Shift.create_shift("15794", "041820")
  end
end
