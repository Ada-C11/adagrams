require "csv"

def draw_letters
  available_letters = {"a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h" => 2,
                       "i" => 9, "j" => 1, "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2,
                       "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1,
                       "y" => 2, "z" => 1}
  drawn_letters = []
  10.times do
    letter = available_letters.keys.sample
    while available_letters[letter] == 0
      letter = available_letters.keys.sample
    end
    drawn_letters.push(letter)
    available_letters[letter] = available_letters[letter] - 1
  end
  return drawn_letters
end

# Method that deletes element in array at its specific index. Prevents deletion of mathcing elements
class Array
  def delete_elements_in_(array)
    array.each do |x|
      if index = index(x)
        delete_at(index)
      end
    end
  end
end

# Checks if user inputs letters from their letter bank
def uses_available_letters?(input, letters_in_hand)
  used_letters = []
  input.each_char do |letter|
    if letters_in_hand.include?(letter) == true
      letters_in_hand.delete_elements_in_([letter])
      used_letters << letter
    else
      letters_in_hand = (letters_in_hand << used_letters).flatten! # Resets letter bank if previous user input included invalid letters
      return false
    end
  end
  letters_in_hand = (letters_in_hand << used_letters).flatten!
  return true
end

#Wave 3
def score_word(word)
  word = word.downcase
  score = 0
  word.each_char do |letter|
    case letter
    when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
      score += 1
    when "d", "g"
      score += 2
    when "b", "c", "m", "p"
      score += 3
    when "f", "h", "v", "w", "y"
      score += 4
    when "k"
      score += 5
    when "j", "x"
      score += 8
    when "q", "z"
      score += 10
    end
  end
  if word.length >= 7
    score += 8
  end
  return score
end

#Wave 4
def highest_score_from(words)
  winning = {}
  high_score = 0
  best_word = nil
  words.each do |word|
    if score_word(word) > high_score
      high_score = score_word(word)
      best_word = word
    elsif score_word(word) == high_score
      if best_word.length == 10
        next
      elsif word.length == 10
        best_word = word
      elsif word.length < best_word.length
        best_word = word
      end
    end
  end
  winning[:word] = best_word
  winning[:score] = high_score
  return winning
end

# Wave 5
def is_in_english_dict?(input)
  english_words = CSV.read("assets/dictionary-english.csv")
  return english_words.flatten!.include?(input)
end
