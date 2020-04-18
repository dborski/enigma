class Key

  attr_reader :number
  def initialize(number = generate_random_num)
    @number = number
  end

  def generate_random_num
    rand(0..99999).to_s.rjust(5, "0")
  end

  def create_keys
    num = generate_random_num
    split_num = num.split(//)
    {A: split_num[0..1].join.to_i,
     B: split_num[1..2].join.to_i,
     C: split_num[2..3].join.to_i,
     D: split_num[3..4].join.to_i}
  end
end
