def binaryCheck(binString)
  arr_pos = []
  con_arr = consecutives(substrings(binString))
  return binString if con_arr.empty?
  con_arr.each do |pair|
    test_string = binString.dup
    pair_one = pair[0][0]
    test_string[pair[0][0]] = pair[1][0]
    test_string[pair[1][0]] = pair_one
    arr_pos << test_string
  end
  arr_pos.max
end

def is_equal(string)
  count_hash = {"0"=>0, "1"=> 0}
  string.each_char do |lett|
    count_hash[lett] += 1
  end
  return true if count_hash["0"] == count_hash["1"]
end


def is_magical(string)
  return false unless is_equal(string)
  last_index = string.length - 1
  (0...last_index).each do |end_value|
    return false if is_equal(string[0..end_value])
  end
  true
end

def substrings(string)
  rt = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      rt << [string[i..j],i,j] if is_magical(string[i..j])
    end
  end
  rt
end

def consecutives(array)
  rt = []
  len = 0
  while len < array.length
    lentwo = 0
    while lentwo < array.length
      rt << [array[len], array[lentwo]] if array[len][2] + 1 == array[lentwo][1] && len != lentwo
      lentwo += 1
    end
    len += 1
  end
  rt
end

p binaryCheck("11011000")

p substrings("1101100")
p binaryCheck("1100")
p binaryCheck("1101001100")
