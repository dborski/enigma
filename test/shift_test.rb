require './test/test_helper'
require './lib/shift.rb'

class KeyTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_can_generate_random_number
    num = @shift.generate_random_num

    assert_equal true, num.to_i < 100000
    assert_equal 5, @shift.generate_random_num.length
  end

  def test_create_keys
    @shift.expects(:generate_random_num).returns("15794")

    expected = {A: 15,
                B: 57,
                C: 79,
                D: 94,
                key: "15794",
                date: "041820"}

    assert_equal expected, @shift.create_keys
  end

  def test_date
    Date.expects(:today).returns(Date.new(2020, 04, 18))

    assert_equal "041820", @shift.date
  end

  def test_create_offsets
    @shift.expects(:date).returns("041820")

    expected = {A: 2,
                B: 4,
                C: 0,
                D: 0,}

    assert_equal expected, @shift.create_offsets
  end

  def test_creates_shift
    @shift.expects(:create_keys).returns({A: 15, B: 57, C: 79, D: 94, key: "15794", date: "041820"})
    @shift.expects(:create_offsets).returns({A: 2, B: 4, C: 0, D: 0})

    expected = {A: 17,
                B: 61,
                C: 79,
                D: 94,
                key: "15794",
                date: "041820"}

    assert_equal expected, @shift.create_shift
  end
end
