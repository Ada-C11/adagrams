# method that creates a hand of letters for the user
def draw_letters

  # hash that store letters and their quantities
  letter_pool = {
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

  # array to hold each indvidual letter in the letter pool as a string
  letter_pool_array = []

  # for each key in the pool, add the key in the quantity of its value into the letter_pool_array array
  letter_pool.each do |letter, quantity|
    letter_pool_array.fill(letter.to_s, letter_pool_array.size, quantity)
  end

  # pulling a random sample of 10 letters from the letter_pool_array
  letters_in_hand = letter_pool_array.sample(10)

  return letters_in_hand
end

# method that checks a user's input against the available letters to make sure they are valid
def uses_available_letters?(input, letters_in_hand)

  # splits the input into an array of characters
  split_input = input.chars

  # pushes true/false values into an array based on if user input is valid
  true_false = []
  split_input.each do |letter|
    # if all letters are available
    if letters_in_hand.include?(letter) && letters_in_hand.count(letter) >= input.count(letter)
      true_false << "true"
    else
      true_false << "false"
    end
  end

  # if all values in the true_false array are true, returns true, else returns false
  if true_false.all? do |statements|
    statements == "true"
  end
    return true
  else
    return false
  end
end

# method that calculates an input word's total score
def score_word(word)
  # hash with arrays as values, to store our score chart
  score_chart = {
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"],
  }

  # splitting input into an array of single letter strings, and changing them to upcase
  split_word = word.upcase.chars

  # for each letter in the input word, goes through the score chart and finds that letter
  # then adds its score to the total variable
  total = 0
  split_word.each do |letter|
    score_chart.each do |score, letters|
      if letters.include?(letter)
        total += score
      end
    end
  end

  # adds an extra eight points if the input word length is greater than 7
  if word.length >= 7
    total += 8
  end

  # returns total score
  return total
end

# method that returns the highest scoring word, and its score
def highest_score_from(words)
  # creating a hash to store the winnning word and score
  word_hash = {
    word: "",
    score: 0,
  }

  # for each word in the array compares against current values in hash to see if it is the winner
  # based on certain conditions
  words.each do |word|
    # if the input word score is greater than the currently stored winning score
    # replaces currently stored word with new winning word and score
    if score_word(word) > word_hash[:score]
      word_hash[:word] = word
      word_hash[:score] = score_word(word)
      # else if the input word score is equal to the currently stored winning score checks for conditions
    elsif score_word(word) == word_hash[:score]
      # if input word length is equal to 10 & the current winning word is not 10
      # replaces the currently stored winning word, with the new winning word
      if word.length == 10 && word_hash[:word].length != 10
        word_hash[:word] = word
        # else if the input word length is less than the currently stored input word length and the currently
        # stored word length is not 10, replaces stored winning word with new winning word
      elsif (word.length < word_hash[:word].length) && (word_hash[:word].length != 10)
        word_hash[:word] = word
      end
    end
  end

  # returns winning word and winning word score in a hash
  return word_hash
end

#method that checks to see if input word is in dictionary-english csv file. If the input word is present
#return true, else return false
require "csv"

def is_in_english_dict?(input)
  dictionary = CSV.read("../assets/dictionary-english.csv")
  input_array = [input]

  if dictionary.include?(input_array)
    return true
  else
    return false
  end
end

# is_in_english_dict?("acronyms")
# returns a boolean true if the input is provided, false if it is not
