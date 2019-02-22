require "csv"

def draw_letters
  alphabet = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x", "y", "y", "z"]
  letters = []
  letters = alphabet.sample(10)

  return letters
end

def uses_available_letters?(input, letters_in_hand)
  split_word = input.split(//)

  split_word.each do |l|
    index = letters_in_hand.index(l)
    if letters_in_hand.index(l) != nil
      letters_in_hand.delete_at(index)
    else
      return false
    end
  end
  return true
end

def score_word(word)
  letters_values = {
    "a" => 1,
    "b" => 3,
    "c" => 3,
    "d" => 2,
    "e" => 1,
    "f" => 4,
    "g" => 2,
    "h" => 4,
    "i" => 1,
    "j" => 8,
    "k" => 5,
    "l" => 1,
    "m" => 3,
    "n" => 1,
    "o" => 1,
    "p" => 3,
    "q" => 10,
    "r" => 1,
    "s" => 1,
    "t" => 1,
    "u" => 1,
    "v" => 4,
    "w" => 4,
    "x" => 8,
    "y" => 4,
    "z" => 10,
  }

  split_word = word.downcase.split(//)

  word_value = split_word.map do |letter|
    letters_values[letter]
  end

  if word.length < 7
    score = word_value.reduce(:+)
  elsif word.length == 0
    score = 0
  else
    score = word_value.reduce(:+) + 8
  end

  return score.to_i
end

def highest_score_from(words)
  best_word = {
    word: "",
    score: 0,
  }
  words.each do |word|
    score = score_word(word)
    if score > best_word[:score]
      best_word[:score] = score
      best_word[:word] = word
    elsif score == best_word[:score]
      if word.length == 10 && best_word[:word].length != 10
        best_word[:word] = word
      elsif (word.length < best_word[:word].length) && (best_word[:word].length != 10)
        best_word[:word] = word
      end
    end
  end

  return best_word
end

def is_in_english_dict?(input)
  CSV.open("assets/dictionary-english.csv", "r").each do |word|
    return true if word.include?(input)
  end
  return false
end
