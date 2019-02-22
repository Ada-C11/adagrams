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

  input.downcase.split(//).each_with_index do |letter, index|
    if letters_in_hand.include?(letter)
      size += 1
      letters_in_hand.delete(index)
    end
  end

  if size == input.length
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

  puts max_words

  if max_words[:words].length == 1
    winner = max_words
  else
    max_words[:words].each do |word|
      if word.length == 10
        winner[:word] = word
        winner[:score] = max_words[:score]
      else
      end
    end
  end
  winner = {}

  # tiebreakers
  # if max_words.length == 1
  #   winner = {
  #     word: max_words.keys[0],
  #     score: max_words.values[0],
  #   }
  #   puts winner
  # elsif max_words.== 10
  # else
  #   min_length_winner = max_words.min_by { |k, v| k.length }
  #   # winner = min_length_winner.to_h
  #   winner[:word] = min_length_winner[0]
  #   winner[:score] = min_length_winner[1]
  #   puts winner
  # end
end

highest_score_from(["bananaa", "aaaaaaaaaa", "ora"])
