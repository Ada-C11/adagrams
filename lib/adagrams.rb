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

# Returns either true or false
# Returns true if every letter in the input word is available (in the right quantities)
# in the letters_in_hand
# Returns false if not; if there is a letter in input that is not present in the letters_in_hand or
# has too much of compared to the letters_in_hand

puts "#{letters_in_hand}"
puts "Please enter an adagram"
input = gets.chomp.upcase!

def uses_available_letters?(input, letters_in_hand)
  input_array = input.split("")
  return (input_array - letters_in_hand).empty?
end

#puts uses_available_letters?(input, letters_in_hand)

# #Has one parameter: word, which is a string of characters
# Returns an integer representing the number of points
# Each letter within word has a point value. The number of points of each letter is
# summed up to represent the total score of word
# Each letter's point value is described in the table below
# If the length of the word is 7, 8, 9, or 10, then the word gets an additional 8 points
def score_word(word)
  points = 0
  word_array = word.split("")
  puts word_array
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
  if word_array.length >= 7 || word_array.length <= 10
    points += 8
  end
  return points
end

puts score_word(input)

# need to figure out how to store the point values for each letter
# how to know what letters the input contains so we can assign point values
# if/else case/when / count

# A, E, I, O, U, L, N, R, S, T	1
# D, G	2
# B, C, M, P	3
# F, H, V, W, Y	4
# K	5
# J, X	8
# Q, Z	10
