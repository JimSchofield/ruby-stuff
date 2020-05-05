require 'colorize'

def grep_it(file_path, pattern_string)
  regex = Regexp.new pattern_string

  file = File.open(file_path)
  lines = file.readlines.each_with_index.map do |line, index|
    [index, line.chomp]
  end

  lines.each do |line|
    puts "#{line[0]}:".green + " #{line[1]}" if regex.match(line[1])
  end

  file.close
end

grep_it('tree.rb', "tree")
