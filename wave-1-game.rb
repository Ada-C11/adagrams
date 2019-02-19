require_relative "lib/adagrams"

def display_welcome_message
  puts "Welcome to Adagrams!"
  puts "Let's draw 10 letters from the letter pool..."
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(", ")
end

def run_game
  display_welcome_message
  display_drawn_letters(draw_letters)
end

available_letters = {"a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h" => 2, 
                     "i" => 9, "j" => 1, "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2, 
                     "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1, 
                     "y" => 2, "z" => 1}

def draw_letters(hash)
  selected_letters = []
  10.times do 
    letter = hash.keys.sample
    selected_letters.push(letter)
    hash[letter] = hash[letter] - 1
  end
  return selected_letters
end

# puts selected_letters
draw_letters(available_letters)
