puts 'Welcome to our guessing game!!!'

answer = rand(1..10)
guess = -1

while answer != guess
  puts '\nPlease enter your guess:'
  guess = gets.to_i
  puts "Your guess is #{guess}"
  puts 'To big!' if guess > answer
  puts 'To small!' if guess < answer
  puts 'CORRECT!' if guess == answer
end
