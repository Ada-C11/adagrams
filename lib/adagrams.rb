letter_quantities = {
  A: 9,
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
  Z: 1,
}
$letter_pool = []
letter_quantities.each do |letter, quantity|
  quantity.times do
    $letter_pool << letter.to_s
  end
end

$letter_scores = {
  1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2 => ["D", "G"],
  3 => ["B", "C", "M", "P"],
  4 => ["F", "H", "V", "W", "Y"],
  5 => ["K"],
  8 => ["J", "X"],
  10 => ["Q", "Z"],
}

# Wave 1
def draw_letters
  letters_in_hand = $letter_pool.sample(10)
  return letters_in_hand
end

# Wave 2
def uses_available_letters?(input, letters_in_hand)
  input = input.upcase.split("")
  # Make a copy of the input array and keep the original 
  # array unchanged. The original input needs to remain in tact so
  # that Ruby can continue to iterate through it the 
  # uses_available_letters methods.
  input_copy = input.dup

  p input

  # Check if letters in the input are all in the letters_in_hand array
  loop_count = 1
  input.each_with_index do |letter, input_index|
    puts "Loop count: #{loop_count}"
    if letters_in_hand.include?(letter)
      hand_index = 0
      letters_in_hand.each_with_index do |letter_in_hand, index|
        if letter == letter_in_hand
          hand_index = index
          break
        end
        hand_index += 1
      end
      puts "This letter is: #{letter}"
      puts "Letters in hand before delete are: #{letters_in_hand}"
      letters_in_hand.delete_at(hand_index)

      i = 0
      input_copy.each_with_index do |input_copy_letter, input_copy_index|
        if input_copy_letter == letter
          i = input_copy_index
          break
        end
      end
      puts "Letters in hand after delete are: #{letters_in_hand}"
      puts "Letters in input_copy before delete are: #{input_copy}"
      input_copy.delete_at(i)
      puts "Letters in input_copy after delete are: #{input_copy}"
    end
    loop_count += 1
  end

  if input_copy.length == 0
    return true
  else
    return false
  end
end

# This method calculates a score for the word the user submits.
def score_word(word)
  total_score = 0
  if word.length > 6
    total_score += 8
  end
  this_word = word.upcase.split("")
  this_word.each do |this_letter|
    $letter_scores.each do |score, letter_array|
      if letter_array.include?(this_letter)
        total_score += score
      end
    end
  end
  return total_score
end

# ["H", "S", "I", "F", "R", "A", "S", "T"]

def highest_score_from(words)
  words_scores_array = []
  words.each do |this_word|
    this_score = score_word(this_word)
    words_scores_array << {
      word: this_word,
      score: this_score,
    }
  end

  scores_array = words_scores_array.map do |this_hash|
    this_hash[:score]
  end
  max_score = scores_array.max
  winning_words = []
  winning_word = {}
  words_scores_array.each do |this_word_score|
    if max_score == this_word_score[:score]
      winning_words << this_word_score[:word]
    end
  end
  # Detect and handle ties
  if winning_words.length > 1
    winning_words.each do |this_word|
      if this_word.length > 9
        winning_word[:word] = this_word
        break
      else
        winning_word[:word] = winning_words.min_by do |nested_word|
          nested_word.length
        end
      end
    end
  else
    winning_word[:word] = winning_words[0]
  end

  winning_word[:score] = max_score.to_i
  return winning_word
end

# letters_in_hand = ["H", "S", "I", "F", "R", "A", "S", "T", "W"]
# p uses_available_letters?("staarfish", letters_in_hand)
# score = score_word("starfish")

# puts winning_words
# puts winning_word
