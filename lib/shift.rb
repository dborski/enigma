class Shift

  def generate_random_num
    rand(0..99999).to_s.rjust(5, "0")
  end

  def date
    Date.today.strftime("%m%d%y")
  end

  def create_keys
    num = generate_random_num
    key_date = date
    split_num = num.split(//)
    {A: split_num[0..1].join.to_i,
     B: split_num[1..2].join.to_i,
     C: split_num[2..3].join.to_i,
     D: split_num[3..4].join.to_i,
     key: num,
     date: key_date}
  end

  def create_offsets
    offset_num = (date.to_i ** 2).to_s
    last_four = offset_num.split(//).last(4).join("")
    {A: last_four[0].to_i,
     B: last_four[1].to_i,
     C: last_four[2].to_i,
     D: last_four[3].to_i}
  end

  def create_shift
    create_keys.merge(create_offsets) { |key, old_val, new_val| old_val + new_val }
  end
end
