require_relative 'test_helper'
require './lib/cipher_algo'

class CipherAlgoTest < Minitest::Test

  def setup
    @cipher_algo = CipherAlgo.new
  end

  def test_it_exists
    assert_instance_of CipherAlgo, @cipher_algo
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @cipher_algo.character_set
  end

  def test_can_generate_random_number_with_leading_zeroes
    @cipher_algo.expects(:rand).returns(45)

    assert_equal "00045", @cipher_algo.generate_random_num
  end

  def test_can_generate_properly_formatted_todays_date
    Date.expects(:today).returns(Date.new(2020, 04, 18))

    assert_equal "041820", @cipher_algo.date_today
  end

  def test_can_encrypt_message
    @cipher_algo.expects(:generate_random_num).returns("15794")
    @cipher_algo.expects(:date_today).returns("041820")

    assert_equal "yljyeguahsb!", @cipher_algo.encrypt_message('HELLO WORLD!')
  end

  def test_can_decrypt_message
    @cipher_algo.expects(:date_today).returns("041820")

    assert_equal "hello world!", @cipher_algo.decrypt_message("yljyeguahsb!", "15794")
  end
end
