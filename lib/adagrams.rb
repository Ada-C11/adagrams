def draw_letters
  alphabet = [
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
    "W", "W", "X",
    "Y", "Y",
    "Z",
  ]

  hand = alphabet.sample(10)

  return hand
end

letters_in_hand = draw_letters

def uses_available_letters?(input, letters_in_hand)
  input_array = input.split("")
  return (input_array - letters_in_hand).empty?
end

def score_word(word)
  points = 0
  scores = []
  word_array = word.split("")
  word_array.each do |letter|
    point_1 = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    point_1.each do |letter_p|
      if letter_p == letter
        points += 1
      end
    end
    point_2 = ["D", "G"]
    point_2.each do |letter_p|
      if letter_p == letter
        points += 2
      end
    end
    point_3 = ["B", "C", "M", "P"]
    point_3.each do |letter_p|
      if letter_p == letter
        points += 3
      end
    end
    point_4 = ["F", "H", "V", "W", "Y"]
    point_4.each do |letter_p|
      if letter_p == letter
        points += 4
      end
    end
    point_5 = ["K"]
    point_5.each do |letter_p|
      if letter_p == letter
        points += 5
      end
    end
    point_8 = ["J", "X"]
    point_8.each do |letter_p|
      if letter_p == letter
        points += 8
      end
    end
    point_10 = ["Q", "Z"]
    point_10.each do |letter_p|
      if letter_p == letter
        points += 10
      end
    end
  end
  if word_array.length >= 7
    points += 8
  end
  scores << points

  return points
end

def highest_score_from(words)
  scores = []
  words.each_with_index do |word, index|
    scores << [score_word(word), word]
  end

  maximum = scores.max
  max = maximum[0]
  puts "#{maximum}"

  tie = scores.flat_map { |i| i }
  variable = tie.count(max)
  puts variable

  high_score = {
    word: maximum[0],
    score: maximum[1],
  }
  puts high_score
  return high_score
end

# count = words.count(maximum[0])
#puts count
# HERE
# scores flat map then count to see if there's a tie for max value

# scores.each do |array|
#   if array[0].include?(maximum[0])
#     puts "it's there #{array}"
#   end
# end

# puts count

# puts "#{scores}"

# --------
# puts "#{words}"
# word_score = score_word(word)
# puts "#{top_score}"
# high_score = words.max_by {|word| word_score }
# variable = words[0]
# word_score = score_word(variable)
# puts word_score

# highest_score_from(words)
# puts score_word(input)

# In the case of tie in scores, use these tie-breaking
# rules:
# prefer the word with the fewest letters...
# ...unless one word has 10 letters. If the top score
# is tied between multiple words and one is 10 letters
#long, choose the one with 10 letters over the one with
#fewer tiles
# If the there are multiple words that are the same
#score and the same length, pick the first one in the
#supplied list
