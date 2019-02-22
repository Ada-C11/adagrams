require "csv"

def draw_letters
  letter_pool = []
  number_of_letters = [9, 2, 2, 3, 12, 2, 3, 2, 9, 1, 1, 4, 2, 6, 8, 2, 1, 6, 4, 6, 4, 2, 2, 1, 2, 1]
  letters = ("A".."Z").to_a
  i = 0
  while i < 26
    number_of_letters[i].times do
      letter_pool.push(letters[i])
    end
    i = i + 1
  end

  return letter_pool.sample(10)
end

puts "Using the following letters, create an Adagram"
test = draw_letters
puts test

puts "What is your Adagram?:"
Adagram_input = gets.chomp.to_s.upcase

def uses_available_letters?(input, letters_in_hand)
  input_array = input.chars
  i = 0
  result = true
  while i < input_array.length
    if letters_in_hand.include?(input[i]) == true
      letters_in_hand.delete(input[i])
    else
      result = false
    end
    i = i + 1
  end
  return result
end

puts uses_available_letters?(Adagram_input, test)

SCORE_HASH = {"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}

def score_word(word)
  points = 0
  if word == ""
    points = 0
  else
    letters = word.upcase.chars
    points = 0
    letters.each do |letter|
      points += SCORE_HASH[letter]
    end

    if letters.length > 6
      points = points + 8
    end
  end

  return points
end

puts score_word(Adagram_input)

def highest_score_from(words)
  word_scores = words.map do |word|
    score_word(word)
  end

  words_scores_hash = {}
  i = 0
  while i < words.length
    words_scores_hash[words[i]] = word_scores[i]
    i += 1
  end
  highest_score = word_scores.max
  highest_score_hash = words_scores_hash.select { |k, v| v == highest_score }

  winning_word = highest_score_hash.values
  result = {word: winning_word[0], score: highest_score}

  if highest_score_hash.length > 1
    winner = {}
    keys = highest_score_hash.keys
    lengths = keys.map { |key| key.length }
    if lengths.include? 10 == true
      winner = {word: keys[lengths.find_index(10)], score: highest_score}

      #highest_score_hash.find{|k,v| v == 10}.first
    else
      min = keys.min_by { |key| key.length }
      winner = {word: min, score: highest_score}
      #winner = highest_score_hash.find{|k,v| k == min}.first
    end
    highest_score_hash[winner[0]] = winner[1]
  end

  result = highest_score_hash

  return result
end

test = ["X", "XX", "XXX", "XXXX"]
puts highest_score_from(test)

def is_in_english_dict?(input)
  input_in_dictionary = false
  CSV.foreach("../assets/dictionary-english.csv") do |row|
    row.each do |word|
      if word == input
        input_in_dictionary = true
      end
    end
  end
  return input_in_dictionary
end

puts is_in_english_dict?("yaw")
