class Shift

  def self.create_keys(key, date)
    split_num = key.split(//)

    {A: split_num[0..1].join.to_i,
     B: split_num[1..2].join.to_i,
     C: split_num[2..3].join.to_i,
     D: split_num[3..4].join.to_i,}
  end

  def self.create_offsets(key, date)
    offset_num = (date.to_i ** 2).to_s
    last_four = offset_num.split(//).last(4).join("")
    
    {A: last_four[0].to_i,
     B: last_four[1].to_i,
     C: last_four[2].to_i,
     D: last_four[3].to_i}
  end

  def self.create_shift(key, date)
    create_keys(key, date).merge(create_offsets(key, date)) { |key, old_val, new_val| old_val + new_val }
  end
end
