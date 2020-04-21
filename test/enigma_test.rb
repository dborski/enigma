require_relative 'test_helper'
require './lib/enigma'
require './lib/shift'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_can_encrypt_message
    @enigma.expects(:generate_random_num).returns("15794")
    @enigma.expects(:date_today).returns("041820")

    expected = {encryption: "yljyeguahsb!",
                key: "15794",
                date: "041820"}

    assert_equal expected, @enigma.encrypt('HELLO WORLD!')
  end

  def test_can_decrypt_message
    @enigma.expects(:date_today).returns("041820")

    expected = {decryption: "hello world!",
                key: "15794",
                date: "041820"}

    assert_equal expected, @enigma.decrypt("yljyeguahsb!", "15794")
  end
end
