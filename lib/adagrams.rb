require "pry"

# populating letter pool

def draw_letters
  letter_distribution = {
    "a" => 9,
    "b" => 2,
    "c" => 2,
    "d" => 4,
    "e" => 12,
    "f" => 2,
    "g" => 3,
    "h" => 2,
    "i" => 9,
    "j" => 1,
    "k" => 1,
    "l" => 4,
    "m" => 2,
    "n" => 6,
    "o" => 8,
    "p" => 2,
    "q" => 1,
    "r" => 6,
    "s" => 4,
    "t" => 6,
    "u" => 4,
    "v" => 2,
    "w" => 2,
    "x" => 1,
    "y" => 2,
    "z" => 1,
  }
  letter_pool = []
  letter_distribution.each do |str, n|
    n.times do
      letter_pool << str.downcase
    end
  end
  hand = letter_pool.shuffle[0..9]
  # print "Here's your hand: #{hand}"
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  if input.length > 10
    puts "Too many letters! Try again: "
    input = gets.chomp.downcase
  end
  if (input.chars.all? { |char| letters_in_hand.include? char })
    valid_input = true
  else
    valid_input = false
  end

  input.chars.each do |letter|
    hand_count = letters_in_hand.count(letter)
    input_count = input.count(letter)
    if hand_count >= input_count
      valid_input = true
    else
      valid_input = false
      break
    end
  end
  return valid_input
end

def score_word(word)
  score_chart = {
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
  word.downcase!
  if word.length > 6
    total_points = 8
  else
    total_points = 0
  end

  word.each_char do |letter|
    total_points += (score_chart[letter])
  end
  return total_points
end

def highest_score_from(words)
  highest_score = 0
  winning_word = {:word => "", :score => 0}
  words.each do |word|
    if score_word(word) > highest_score
      highest_score = score_word(word)
      winning_word[:word] = word.upcase
      winning_word[:score] = highest_score
    elsif score_word(word) == highest_score
      if word.length == 10
        winning_word[:word] = word.upcase
      elsif (word.length < winning_word[:word].length) && (winning_word[:word].length != 10)
        winning_word[:word] = word.upcase
        # elsif word.length == winning_word[:word].length
        #   break
      end
    end
  end
  # puts "The word with the highest score is: #{winning_word}"
  return winning_word
end

########### Starting the game ############
# puts "Insert number of players"
# num_players = gets.chomp.to_i

# player_results = []
# num_players.times do
#   player_word = {}
#   draw_letters
#   puts "\n\nInsert your Adagram: "
#   input = gets.chomp.downcase
#   uses_available_letters?(input, @hand)
#   total_points = score_word(input)
#   player_word[:word] = input
#   player_word[:score] = total_points
#   player_results << player_word
# end

# played_words = []
# player_results.each do |word|
#   played_words << word[:word]
# end

# highest_score_from_words(played_words)
