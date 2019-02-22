def draw_letters
  letterset = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]

  hand = letterset.sample(10)
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  word_array = []
  input.each_char { |letter| word_array << letter }
  return word_array & letters_in_hand == word_array
end

def score_word(word)
  letter_value = {
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
    total = total + letter_score
  end
  if word.length > 6 && word.length < 11
    total = total + 8
  end
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
