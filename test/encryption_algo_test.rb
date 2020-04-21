require './test/test_helper'
require './lib/shift.rb'
require './lib/encryption_algo.rb'

class EncryptionAlgoTest < Minitest::Test

  def setup
    @encryption_algo = EncryptionAlgo.new
  end

  def test_it_exists
    assert_instance_of EncryptionAlgo, @encryption_algo
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @encryption_algo.character_set
  end

  def test_can_generate_random_number
    num = @encryption_algo.generate_random_num

    assert_equal true, num.to_i < 100000
    assert_equal 5, @encryption_algo.generate_random_num.length
  end

  def test_date
    Date.expects(:today).returns(Date.new(2020, 04, 18))

    assert_equal "041820", @encryption_algo.date_today
  end

  def test_can_encrypt_message
    @encryption_algo.expects(:generate_random_num).returns("15794")
    @encryption_algo.expects(:date_today).returns("041820")

    assert_equal "yljyeguahsb!", @encryption_algo.encrypt_message('HELLO WORLD!')
  end

  def test_can_decrypt_message
    @encryption_algo.expects(:date_today).returns("041820")

    assert_equal "hello world!", @encryption_algo.decrypt_message("yljyeguahsb!", "15794")
  end
end
