class Key

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def generate_random_num
    rand(0..99999).to_s.rjust(5, "0")
  end
end
