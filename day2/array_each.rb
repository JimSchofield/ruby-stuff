my_array = (1..16).to_a

my_array.each_with_index do |el, index|
  puts my_array[index..(index + 3)].to_s if (index % 4).zero?
end
