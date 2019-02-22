require "pry"
require "csv"

LETTER_POOL =
  {A: 9,
   B: 2,
   C: 2,
   D: 4,
   E: 12,
   F: 2,
   G: 3,
   H: 2,
   I: 9,
   J: 1,
   K: 1,
   L: 4,
   M: 2,
   N: 6,
   O: 8,
   P: 2,
   Q: 1,
   R: 6,
   S: 4,
   T: 6,
   U: 4,
   V: 2,
   W: 2,
   X: 1,
   Y: 2,
   Z: 1}

def score_word(word)
  word = word.upcase

  score = 0
  word.split("").each do |char|
    case
    when "AEIOULNRST".include?(char)
      score += 1
    when "DG".include?(char)
      score += 2
    when "BCMP".include?(char)
      score += 3
    when "FHVWY".include?(char)
      score += 4
    when "K".include?(char)
      score += 5
    when "JX".include?(char)
      score += 8
    when "QZ".include?(char)
      score += 10
    end
  end
  if word.length >= 7
    score += 8
  end

  return score
end

def draw_letters
  letters_hash = {}
  letters_array = []
  i = 0
  until i == 10
    char = LETTER_POOL.to_a.sample[0]

    if letters_hash.has_key?(char)
      if letters_hash[char] < LETTER_POOL[char].to_i
        letters_hash.merge!({char => letters_hash[char] + 1})
        letters_array << char.to_s
        i += 1
      end
    else
      letters_hash.merge!({char => 1})
      letters_array << char.to_s
      i += 1
    end
  end
  return letters_array
end

def uses_available_letters?(input, letters_in_hand)
  input.upcase!
  popping_array = letters_in_hand.clone
  check = true
  input.split("").each do |char|
    if !popping_array.include?(char)
      check = false
    else
      index = popping_array.find_index(char)
      popping_array.delete_at(index)
    end
  end
  return check
end

def highest_score_from(words)
  words_and_scores = []
  words.each do |word|
    hash = {}
    score = score_word(word)
    hash.merge!({word: word, score: score})
    words_and_scores << hash
  end

  temp_hash = words_and_scores.max_by { |x| x[:score] }

  max_score = temp_hash[:score]

  highest_scoring_words = words_and_scores.select { |x| x[:score] == max_score }

  winner = ""
  if highest_scoring_words.length > 1
    highest_scoring_words.each do |hash|
      if hash[:word].length == 10
        winner = hash[:word]
        break
      else
        winner_hash = highest_scoring_words.min_by { |hash2| hash2[:word].length }
        winner = winner_hash[:word]
      end
    end
    result_hash = {word: winner, score: max_score}
  else
    result_hash = temp_hash
  end

  return result_hash
end

def is_in_english_dict?(input)
  dictionary = CSV.read("assets/dictionary-english.csv")
  input.downcase!
  word_in_array = [input]
  if dictionary.include? word_in_array
    return true
  else
    return false
  end
end
