require_relative "lib/adagrams"

def display_welcome_message
  puts "Welcome to Adagrams!"
  puts "Let's draw 10 letters from the letter pool..."
end

def make_letter_pool(arr, letter, frequency)
  frequency.times do
    arr.push(letter)
  end
end

letter_distribution = []

make_letter_pool(letter_distribution, "A", 9)
make_letter_pool(letter_distribution, "B", 2)
make_letter_pool(letter_distribution, "C", 2)
make_letter_pool(letter_distribution, "D", 4)
make_letter_pool(letter_distribution, "E", 12)
make_letter_pool(letter_distribution, "F", 2)
make_letter_pool(letter_distribution, "G", 3)
make_letter_pool(letter_distribution, "H", 2)
make_letter_pool(letter_distribution, "I", 9)
make_letter_pool(letter_distribution, "J", 1)
make_letter_pool(letter_distribution, "K", 1)
make_letter_pool(letter_distribution, "L", 4)
make_letter_pool(letter_distribution, "M", 2)
make_letter_pool(letter_distribution, "N", 6)
make_letter_pool(letter_distribution, "O", 8)
make_letter_pool(letter_distribution, "P", 2)
make_letter_pool(letter_distribution, "Q", 1)
make_letter_pool(letter_distribution, "R", 6)
make_letter_pool(letter_distribution, "S", 4)
make_letter_pool(letter_distribution, "T", 6)
make_letter_pool(letter_distribution, "U", 4)
make_letter_pool(letter_distribution, "V", 2)
make_letter_pool(letter_distribution, "W", 2)
make_letter_pool(letter_distribution, "X", 1)
make_letter_pool(letter_distribution, "Y", 2)
make_letter_pool(letter_distribution, "Z", 1)

def draw_letters
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(", ")
end

def run_game
  display_welcome_message
  display_drawn_letters(draw_letters)
end

run_game
