DRAW_LETTERS = %w[A A A A A A A A A B B
  C C D D D D E E E E E E
  E E E E E E F F G G G H
  H I I I I I I I I I J K
  L L L L M M N N N N N N
  O O O O O O O O P P Q
  R R R R R R S S S S
  T T T T T T U U U U
  V V W W X Y Y Z]

def display_welcome_message
puts "Welcome to Adagrams!"
end

def display_drawn_letters(letters)
letters.shuffle
letters_in_hand = letters.sample(10)
puts "You have drawn the letters:"
puts letters_in_hand.join(', ')
return letters_in_hand
end

def display_game_instructions
puts "Please input your submission for the longest anagram you can come up with"
result = get_user_input()
return result 
end

def uses_available_letters?(user_input_word, letters_in_hand)
user_input_word.each_char do |letter|
if !letters_in_hand.include?(letter)
puts "You entered in a word that contains characters not in the letter bank"
display_game_instructions
else    
letters_in_hand.delete(letter.size)
end
end
display_score(user_input_word)
end

SCORE_VALUE = { A: 1 ,B: 3, C: 3, D: 2, E: 1, F: 4,G: 2, H: 4, I: 1, J: 8, K: 5 ,L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10 , R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10 }.freeze

def display_score(user_input_word)
scored = 0 
user_input_word.each_char do |letter|
scored += SCORE_VALUE[letter.to_sym].to_i
end
if user_input_word.length > 6 
  scored += 8
end
return scored 
end

def display_retry_instructions
puts "Should we play another round?"
puts "Enter y to replay"
end

def display_goodbye_message
puts "Thanks for playing Adagrams!"
end

def get_user_input
word = gets.chomp.upcase
return word
end

def run_game
display_welcome_message

should_continue = true

while should_continue
puts "Let's draw 10 letters from the letter pool..."

letters = DRAW_LETTERS
display_drawn_letters(letters)

user_input_word = display_game_instructions()

while ( !(uses_available_letters?(user_input_word, letters)) )
display_needs_valid_input_message
user_input_word = get_user_input
end

score = display_score(user_input_word)

puts score

display_retry_instructions
should_continue = get_user_input == "y"
end

display_goodbye_message
end

run_game