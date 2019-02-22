require "pry"

def draw_letters
  letter_pool = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }
  letter_array = []
  letter_pool.each do |letter, quantity|
    quantity.times do
      letter_array << letter.to_s.downcase
    end
  end
  return letter_array.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  # size = 0
  input_array = input.upcase.split(//)

  letters_in_hand.each do |letter|
    if input_array.include?(letter)
      # input_array delete
      input_array.delete(letter)
    end
  end

  input_array.length == 0 ? true : false
end

def score_word(word)
  points = 0
  word.upcase.split(//).each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      points += 1
    when "D", "G"
      points += 2
    when "B", "C", "M", "P"
      points += 3
    when "F", "H", "V", "W", "Y"
      points += 4
    when "K"
      points += 5
    when "J", "X"
      points += 8
    when "Q", "Z"
      points += 10
    end
  end

  if word.length > 6 && word.length < 11
    points += 8
  end

  return points
end

def highest_score_from(words)
  highest_score = Hash.new(0)

  words.each do |word|
    highest_score[word] = score_word(word)
  end

  max_words = {
    words: [],
    score: [],
  }

  highest_score.each do |k, v|
    if v == highest_score.values.max
      max_words[:words] << k
      max_words[:score] = v
    end
  end
  winner = {}

  min_length = 10
  if max_words[:words].length == 1
    winner = max_words
  else
    max_words[:words].each do |word|
      if word.length == 10
        winner[:word] = word
        winner[:score] = max_words[:score]
      elsif word.length < min_length
        min_length = word.length
        winner[:word] = word
        winner[:score] = max_words[:score]
      end
    end
  end
  return winner
end

# test_0001_returns true if the submitted letters are valid against the drawn letters FAIL

#  test_0002_accurately finds best scoring word even if not sorted FAIL (0.00s)

#  test_0001_returns a hash that contains the word and score of best word in an array FAIL (0.00s)

#  test_0007_in case of tied score and same length words, prefers the first word FAIL (0.00s)

#   test_0005_in case of tied score, prefers most the word with 10 letters FAIL (0.00s)
