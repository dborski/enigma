require './test/test_helper'
require './lib/key.rb'

class KeyTest < Minitest::Test

  def setup
    @key = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @key
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
                D: 94,
                key: "15794",
                date: "041820"}

    assert_equal expected, @key.create_keys
  end

  def test_date
    Date.expects(:today).returns(Date.new(2020, 04, 18))

    assert_equal "041820", @key.date
  end

  def test_create_offsets
    @key.expects(:date).returns("041820")

    expected = {A: 2,
                B: 4,
                C: 0,
                D: 0,}

    assert_equal expected, @key.create_offsets
  end

  def test_creates_shift
    @key.expects(:create_keys).returns({A: 15, B: 57, C: 79, D: 94, key: "15794", date: "041820"})
    @key.expects(:create_offsets).returns({A: 2, B: 4, C: 0, D: 0})

    expected = {A: 17,
                B: 61,
                C: 79,
                D: 94,
                key: "15794",
                date: "041820"}

    assert_equal expected, @key.create_shift
  end
end
