require "csv"

LETTER_POOL = %w(A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I
  I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T
  T T T U U U U V V W W X Y Y Z)
  
def display_welcome_message
  puts "Welcome to Adagrams!"
end

def draw_letters
  drawn_letters = LETTER_POOL.sample(10)
  return drawn_letters
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(', ')
end

def display_game_instructions
  puts "Please input your submission for the longest anagram you can come up with"
end

def display_needs_valid_input_message
  puts "You entered in a word that contains characters not in the letter bank"
  display_game_instructions
end

def display_retry_instructions
  puts "Should we play another round?"
  puts "Enter y to replay"
  puts "Enter n to quit"
end

def display_not_in_letter_bank_message
  puts "You entered in a word that contains characters not in the letter bank"
  display_game_instructions
end

def display_score(score)
  puts "Your submitted anagram scored #{score} points"
end

def display_highest_score(high_score_hash)
  puts "Thanks for playing Adagrams!"
  puts "The highest score from this game was #{high_score_hash[:word]}, which was worth #{high_score_hash[:score]} points"
end

def display_goodbye_message
  puts "Goodbye!"
end

# Wave 2

def get_user_input
  gets.chomp.upcase
end

def uses_available_letters?(input, letters_in_hand)
  letters = input.upcase.split('')
  letters_in_hand.each do |l|
    i = letters.index(l)
    next if i.nil?
    letters.delete_at(i)
    return true if letters.empty?
  end
  false
 end
 
# Wave 3

def score_word (word)
  score = 0
  word.upcase.split('').each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F", "H", "G", "W", "Y"
      score += 4
    when "K"
      score += 5
    when "J", "X"
      score += 8
    when "Q", "Z"
      score += 10
    else
      score += 0
    end
  end
  if word.length >= 7 && word.length <= 10
    score += 8
  end
  return score
end

# Wave 4

def highest_score_from(words)
  best_word = {
    word: '',
    score: 0
  }
  words.each do |word|
    if score_word(word) > best_word[:score]
      best_word[:score] = score_word(word)
      best_word[:word] = word

    elsif score_word(word) == best_word[:score]
      if best_word[:word].length < word.length && word.length == 10
        best_word[:word] = word
        best_word[:score] = score_word(word)

      elsif best_word[:word].length > word.length && best_word[:word].length < 10
        best_word[:word] = word
        best_word[:score] = score_word(word)
      end
    end
  end
  return best_word
end

# Wave 5
# Curently able to read the file but unable to check with user word
# def is_in_english_dict? (input)
#   dictionary = ''
#   CSV.foreach(File.path("dictionary-english.csv")) do |row|
#     dictionary = row
#     puts dictionary  
#   end
#     if dictionary.include?(input)
#       puts "true"
#     else
#       puts "false"
#     end
# end

def run_game
  played_words = []

  display_welcome_message

  should_continue = true

  while should_continue
    puts "Let's draw 10 letters from the letter pool..."

    letter_bank = draw_letters
    display_drawn_letters(letter_bank)

    display_game_instructions

    user_input_word = get_user_input

    while ( !(uses_available_letters?(user_input_word, letter_bank)) )
      display_needs_valid_input_message
      user_input_word = get_user_input
    end

    score = score_word(user_input_word)
    played_words << user_input_word

    display_score(score)

    display_retry_instructions
    should_continue = get_user_input == "Y"
  end

  display_highest_score(highest_score_from(played_words))
  display_goodbye_message
end

run_game
