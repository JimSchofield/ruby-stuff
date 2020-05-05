my_array = (1..16).to_a

my_array.each_slice(4) { |a| puts a.to_s }
