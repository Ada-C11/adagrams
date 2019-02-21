def draw_letters
  pool = [
    "A", "A", "A", "A", "A", "A", "A", "A", "A",
    "B", "B",
    "C", "C",
    "D", "D", "D", "D",
    "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
    "F", "F",
    "G", "G", "G",
    "H", "H",
    "I", "I", "I", "I", "I", "I", "I", "I", "I",
    "J",
    "K",
    "L", "L", "L", "L",
    "M", "M",
    "N", "N", "N", "N", "N", "N",
    "O", "O", "O", "O", "O", "O", "O", "O",
    "P", "P",
    "Q",
    "R", "R", "R", "R", "R", "R",
    "S", "S", "S", "S",
    "T", "T", "T", "T", "T", "T",
    "U", "U", "U", "U",
    "V", "V",
    "W", "W",
    "X",
    "Y", "Y",
    "Z",
  ]

  hand = pool[1..98].sample(10)
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  word = input.upcase
  split_word = word.split("")

  split_word.each do |letter|
    index = letters_in_hand.index(letter)
    if letters_in_hand.all? { letter } && index != nil
      letters_in_hand.delete_at(index)
    else
      return false
    end
  end
  return true
end

def score_word(word)
  score_hash = {
    "A" => 1, "B" => 3, "C" => 3, "D" => 2,
    "E" => 1, "F" => 4, "G" => 2, "H" => 4,
    "I" => 1, "J" => 8, "K" => 5, "L" => 1,
    "M" => 3, "N" => 1, "O" => 1, "P" => 3,
    "Q" => 10, "R" => 1, "S" => 1, "T" => 1,
    "U" => 1, "V" => 4, "W" => 4, "X" => 8,
    "Y" => 4, "Z" => 10,
  }
  word = word.upcase
  letters = word.split("")
  score = 0
  letters.each do |letter|
    score += score_hash[letter]
  end
  if word.length >= 7 && word.length <= 10
    score += 8
  end
  return score
end

def highest_score_from(words)
  final_winner = {
    word: "",
    score: 0,
  }
  words.each do |word|
    score = score_word(word)
    if score > final_winner[:score]
      final_winner[:score] = score
      final_winner[:word] = word
    elsif score == final_winner[:score]
      if word.length == 10 && final_winner[:word].length != 10
        final_winner[:word] = word
      elsif (word.length < final_winner[:word].length) && (final_winner[:word].length != 10)
        final_winner[:word] = word
      end
    end
  end

  return final_winner
end
