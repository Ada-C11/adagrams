require 'pry'
require 'terminal-table'

def array_gen(hash, array)
    hash.each do |key, value|
        value.times do
            array << key.to_s
        end
    end
end

def draw_letters 

    letter_freq = { 
        A: 9, N: 6, B: 2, O: 8, C: 2, P: 2, D: 4, Q: 1, E: 12, R: 6, F: 2, S: 4,
        G: 3, T: 6, H: 2, U: 4, I: 9, V: 2, J: 1, W: 2, K: 1, X: 1, L: 4, Y: 2, M: 2, Z: 1
    }

    avail_letters = []
    array_gen(letter_freq, avail_letters)
    
    used_letters = []
    10.times do
        curr_letter = avail_letters[rand(0...avail_letters.length)]
        used_letters << curr_letter
        avail_letters.delete(curr_letter)
    end
    return used_letters
end

# puts draw_letters
curr_in_hand = draw_letters
puts curr_in_hand

def uses_available_letters? (input, letters_in_hand)
    if input.length > letters_in_hand.length
        puts "Whoa, buddy. You used more letters than you have in your hand! Try again. "
        return false
    else
        possible_letters = letters_in_hand
        input_array = input.split(//)
        input_array.each do |char|
            if possible_letters.include?(char)
               possible_letters.delete(char)
            else
                "Oh nooooo. You used a letter, #{char}, that's not in your hand"
                return false
            end
        end
    end
    return true
end

input = gets.chomp.upcase
puts uses_available_letters?(input, curr_in_hand)


def score_word(word)
    letter_score = { 
        A: 1, N: 1, B: 3, O: 1, C: 3, P: 3, D: 2, Q: 10, E: 1, R: 1, F: 4, S: 1,
        G: 2, T: 1, H: 4, U: 1, I: 1, V: 4, J: 8, W: 4, K: 5, X: 8, L: 1, Y: 4, M: 3, Z: 10
    }
    word_score = 0