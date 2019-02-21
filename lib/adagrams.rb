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

  hand1 = pool[1..98].sample(10)
  print hand1
  return hand1
end

def uses_available_letters?(input, letters_in_hand)
  input = input.upcase
  input.each_char do |c|
    if letters_in_hand.include?(c)
      letters_in_hand = letters_in_hand.reject { |char| c }
      puts letters_in_hand
    else
      puts "This is false"
      return false
    end
  end
  puts "its true"
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

# rand_var = draw_letters
# store method return values in  like above?

# puts "Enter word: "
# word = gets.chomp.upcase

# uses_available_letters?(word, (rand_var))
# puts "Score: #{score_word(word)}"

def highest_score_from(words)
  all_scores = []

  words.each do |word|
    score = score_word(word)
    all_scores << score
  end

  highest_score_index = all_scores.index(all_scores.max)

  best_score = all_scores[highest_score_index]

  highest_indexes = all_scores.each_index.select { |x| all_scores[x] == best_score }

  all_best_words = []

  highest_indexes.each do |index|
    all_best_words << words[index]
  end

  if all_best_words.length == 2
    if all_best_words[0].length == 10
      best_word = all_best_words[0]
    else
      if all_best_words[0].length > all_best_words[1].length
        best_word = all_best_words[1]
      else
        best_word = all_best_words[0]
      end
    end
  elsif all_best_words.length > 2
    best_word = all_best_words[0]
  end

  return final_data = {
           word: best_word,
           score: best_score,
         }
end

# test = ["APPLE", "PEAR", "CAT", "APPLE"]

# score_word(test[0])
# puts highest_score_from_words(test)
