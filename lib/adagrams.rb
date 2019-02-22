POINTS_HASH = {A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10}
LETTER_ARRAY = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]

def draw_letters
  letter_array = LETTER_ARRAY.clone
  new_hand = []
  10.times do
    letter = letter_array.sample
    new_hand.push(letter)
    letter_array.delete_at(letter_array.find_index(letter))
  end
  return new_hand
end

def uses_available_letters?(input, letters_in_hand)
  input_array = input.upcase.split("").uniq
  input_array.each do |letter|
    return false if input.count(letter) > letters_in_hand.count(letter)
  end
  return true
end

def score_word(word)
  points = 0
  word.each_char do |letter|
    points += POINTS_HASH[letter.upcase.to_sym]
  end
  points += 8 if word.length >= 7
  return points
end

def highest_score_from(words)
  score_array = words.map do |word|
    {word: word, score: score_word(word)}
  end
  best_score = score_array.max_by do |word_hash|
    word_hash[:score]
  end
  highest_score = best_score[:score]
  best_scores = score_array.select do |score_hash|
    score_hash[:score] == highest_score
  end

  return best_scores[0] if best_scores.length == 1

  best_scores.each do |score_hash|
    return score_hash if score_hash[:word].length == 10
  end

  return best_scores.min_by do |score_hash|
           score_hash[:word].length
         end
end
