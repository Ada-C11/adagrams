
require "awesome_print"

def draw_letters
  letter_pool = []
  9.times do
    letter_pool << "A"
    letter_pool << "I"
  end

  2.times do
    letter_pool << "B"
    letter_pool << "C"
    letter_pool << "F"
    letter_pool << "H"
    letter_pool << "M"
    letter_pool << "P"
    letter_pool << "V"
    letter_pool << "W"
    letter_pool << "Y"
  end

  4.times do
    letter_pool << "D"
    letter_pool << "L"
    letter_pool << "S"
    letter_pool << "U"
  end

  12.times do
    letter_pool << "E"
  end

  3.times do
    letter_pool << "G"
  end
  1.times do
    letter_pool << "J"
    letter_pool << "K"
    letter_pool << "Q"
    letter_pool << "X"
    letter_pool << "Z"
  end

  6.times do
    letter_pool << "N"
    letter_pool << "R"
    letter_pool << "T"
  end

  8.times do
    letter_pool << "O"
  end

  letter_pool.sort!

  rand_letter = []
  10.times do
    rand_letter << letter_pool.sample
  end
  return rand_letter
end

letters_in_hand = draw_letters

puts letters_in_hand

puts "What word would you like to create?"
user_input = gets.chomp

input_array = user_input.upcase.split(//)

# puts "#{input_array}"

def uses_available_letters?(input, letters_in_hand)
  puts input
  puts letters_in_hand
  if input.length <= 10
    input.each do |letter|
      if !letters_in_hand.include?(letter)
        print "FALSE"
        return false
      end

      letters_in_hand.delete_at(letters_in_hand.index(letter))
    end
    print "true"
    return true
  else
    print "false"
    return false
  end
end

uses_available_letters?(input_array, letters_in_hand)
puts "new array :#{letters_in_hand}"

def score_word(word)
  word_array = word.upcase.split(//)
  score = 0

  word_array.each do |letter|
    if letter == "A" || letter == "E" || letter == "I" || letter == "O" || letter == "U" || letter == "L" || letter == "N" || letter == "R" || letter == "S" || letter == "T"
      score += 1
    elsif letter == "D" || letter == "G"
      score += 2
    elsif letter == "B" || letter == "C" || letter == "M" || letter == "P"
      score += 3
    elsif letter == "F" || letter == "H" || letter == "V" || letter == "W" || letter == "Y"
      score += 4
    elsif letter == "K"
      score += 5
    elsif letter == "J" || letter == "X"
      score += 8
    elsif letter == "Q" || letter == "Z"
      score += 10
    end
  end

  if word_array.length > 6
    score += 8
  end
  puts "score: #{score}"
  return score
end
