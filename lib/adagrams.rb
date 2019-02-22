
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

user_input = gets.chomp

def uses_available_letters?(input, letters_in_hand)
  input_array = input.upcase.split(//)

  if input_array.length <= 10
    input_array.each do |letter|
      if !letters_in_hand.include?(letter)
        return false
      end

      letters_in_hand.delete_at(letters_in_hand.index(letter))
    end
    return true
  else
    return false
  end
end

uses_available_letters?(user_input, letters_in_hand)

def score_word(word)
  word_array = word.upcase.split(//)
  score = 0

  letter_scores = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10,
  }

  word_array.each do |letter|
    score += letter_scores[letter]
  end

  if word_array.length > 6
    score += 8
  end

  return score
end

def highest_score_from(words)
  scores = []
  words.each do |word|
    scores << score_word(word)
  end

  max_score = scores.max
  n = scores.length
  winning_word_array = []

  (0..n - 1).each do |n|
    if scores[n] == max_score
      winning_word_array << words[n]
    end
  end

  winning_word = ""
  winning_word_array.each do |word|
    if word.length == 10
      winning_word = word
      break
    else
      winning_word = winning_word_array.min_by { |word| word.length }
    end
  end

  winning_word_hash = {}
  winning_word_hash[:word] = winning_word
  winning_word_hash[:score] = max_score

  return winning_word_hash
end
