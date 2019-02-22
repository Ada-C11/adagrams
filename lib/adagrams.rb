def draw_letters
  letter_distribution =
    {
      A: 9, B: 2, C: 2, D: 4, E: 12, F: 2,
      G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2,
      N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6,
      U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1,
    }
  letterset = []
  letter_distribution.each do |letter, value|
    value.times do
      letterset << letter.to_s
    end
  end
  hand = letterset.sample(10)
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  word_array = []
  input.each_char { |letter| word_array << letter }
  return word_array & letters_in_hand == word_array
end

def score_word(word)
  letter_value =
    {
      "AEIOULNRST" => 1,
      "DG" => 2,
      "BCMP" => 3,
      "FHVWY" => 4,
      "K" => 5,
      "JX" => 8,
      "QZ" => 10,
    }
  total = 0
  letter_score = 0

  word.upcase.each_char do |letter|
    letter_value.each do |key, value|
      if key.include?(letter)
        letter_score = value
      end
    end
    total += letter_score
  end
  total += 8 if word.length > 6 && word.length < 11
  return total
end

def highest_score_from(words)
  best_word = ""
  best_score = 0
  highest_score = {}

  words.each do |word|
    score = score_word(word)

    if score > best_score
      best_score = score
      best_word = word
    elsif score == best_score && word.length < best_word.length && best_word.length != 10
      best_word = word
    elsif score == best_score && word.length == 10 && best_word.length != 10
      best_word = word
    end
  end
  highest_score.store(:word, best_word)
  highest_score.store(:score, best_score)
  return highest_score
end
