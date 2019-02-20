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
# set up all characters for adagram use
   

    # 9.times {avail_letters << "A"}
    # 2.times {avail_letters << "B"}
    # 2.times {avail_letters << "C"}
    # 4.times {avail_letters << "D"}
    # 12.times {avail_letters << "E"}
    # 2.times {avail_letters << "F"}
    # 3.times {avail_letters << "G"}
    # 2.times {avail_letters << "H"}
    # 9.times {avail_letters << "I"}
    # 1.times {avail_letters << "J"}
    # 1.times {avail_letters << "K"}
    # 4.times {avail_letters << "L"}
    # 2.times {avail_letters << "M"}
    # 6.times {avail_letters << "N"}
    # 8.times {avail_letters << "O"}
    # 2.times {avail_letters << "P"}
    # 1.times {avail_letters << "Q"}
    # 6.times {avail_letters << "R"}
    # 4.times {avail_letters << "S"}
    # 6.times {avail_letters << "T"}
    # 4.times {avail_letters << "U"}
    # 2.times {avail_letters << "V"}
    # 2.times {avail_letters << "W"}
    # 1.times {avail_letters << "X"}
    # 2.times {avail_letters << "Y"}
    # 1.times {avail_letters << "Z"}

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

puts draw_letters