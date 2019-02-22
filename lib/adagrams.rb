def draw_letters
  def create_letter_array(letter, amount)
    letter_array = []
    amount.times do
      letter_array << letter
    end
    return letter_array
  end

  letter_bag = create_letter_array("A", 9) + create_letter_array("B", 2) + create_letter_array("C", 2) + create_letter_array("D", 4) + create_letter_array("E", 12) + create_letter_array("F", 2) + create_letter_array("G", 3) + create_letter_array("H", 2) + create_letter_array("I", 9) + create_letter_array("J", 1) + create_letter_array("K", 1) + create_letter_array("L", 4) + create_letter_array("M", 2) + create_letter_array("N", 6) + create_letter_array("O", 8) + create_letter_array("P", 2) + create_letter_array("Q", 1) + create_letter_array("R", 6) + create_letter_array("S", 4) + create_letter_array("T", 6) + create_letter_array("U", 4) + create_letter_array("V", 2) + create_letter_array("W", 2) + create_letter_array("X", 1) + create_letter_array("Y", 2) + create_letter_array("Z", 1)
  return letter_bag.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  new_array = letters_in_hand.clone
  input_to_array = input.upcase.split("")

  input_to_array.each do |letter|
    if new_array.include?(letter)
      new_array.delete_at(new_array.index(letter))
    else
      return false
    end
  end
  return true
end

def score_word(word)
  point_value = [
    {
      letters: ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      values: 1,
    },
    {
      letters: ["D", "G"],
      values: 2,
    },
    {
      letters: ["B", "C", "M", "P"],
      values: 3,
    },
    {
      letters: ["F", "H", "V", "W", "Y"],
      values: 4,
    },
    {
      letters: ["K"],
      values: 5,
    },
    {
      letters: ["J", "X"],
      values: 8,
    },
    {
      letters: ["Q", "Z"],
      values: 10,
    },
  ]

  word_score = 0
  arr_word = word.upcase.split("")
  letter_score = 0
  arr_word.each do |letter|
    point_value.each do |pair|
      if pair[:letters].include?(letter)
        letter_score = pair[:values]
      end
    end
    word_score += letter_score
  end
  if arr_word.length > 6
    word_score += 8
  end
  return word_score
end

def highest_score_from(words)
  words_with_scores_array = []
  score_of_words = words.map do |word|
    words_with_scores_array << {
      word: word,
      score: score_word(word),
    }
  end
  winning_word = words_with_scores_array.max_by do |word_score_hash|
    word_score_hash[:score]
  end
  winners = []
  words_with_scores_array.each do |word|
    if word[:score] == winning_word[:score]
      winners << word
    end
  end
  if winners.length == 1
    return winning_word
  else # if there's a tie
    winners.each do |winner|
      return winner if winner[:word].length == 10
    end
    return winners.min_by do |winner|
             winner[:word].length
           end
  end
end

p highest_score_from(["dot", "lat", "at"])
