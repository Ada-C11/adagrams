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
  size = 0
  input_array = input.upcase.split(//)

  letters_in_hand.each_with_index do |letter, index|
    if input_array.include?(letter)
      size += 1
      letters_in_hand.delete(index)
    end
  end
  if size == input_array.length
    return true
  else
    return false
  end
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

  score_word = {
    words: [],
    score: [],
  }

  highest_score.each do |k, v|
    if v == highest_score.values.max
      score_word[:words] << k
      score_word[:score] = v
    end
  end

  best_word = {}

  min_length = 10
  if score_word[:words].length == 1
    best_word = score_word
  else
    score_word[:words].each do |word|
      if word.length == 10
        best_word[:word] = word
        best_word[:score] = score_word[:score]
      elsif word.length < min_length
        min_length = word.length
        best_word[:word] = word
        best_word[:score] = score_word[:score]
      end
    end
  end
  return best_word
end
