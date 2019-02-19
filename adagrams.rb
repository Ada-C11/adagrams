require 'pry'

def draw_letters 

# set up all characters for adagram use
    avail_letters = []
    9.times {avail_letters << "A"}
    2.times {avail_letters << "B"}
    2.times {avail_letters << "C"}
    4.times {avail_letters << "D"}
    12.times {avail_letters << "E"}
    2.times {avail_letters << "F"}
    3.times {avail_letters << "G"}
    2.times {avail_letters << "H"}
    9.times {avail_letters << "I"}
    1.times {avail_letters << "J"}
    1.times {avail_letters << "K"}
    4.times {avail_letters << "L"}
    2.times {avail_letters << "M"}
    6.times {avail_letters << "N"}
    8.times {avail_letters << "O"}
    2.times {avail_letters << "P"}
    1.times {avail_letters << "Q"}
    6.times {avail_letters << "R"}
    4.times {avail_letters << "S"}
    6.times {avail_letters << "T"}
    4.times {avail_letters << "U"}
    2.times {avail_letters << "V"}
    2.times {avail_letters << "W"}
    1.times {avail_letters << "X"}
    2.times {avail_letters << "Y"}
    1.times {avail_letters << "Z"}

    used_letters = []

    10.times do
        curr_letter = avail_letters[rand(0...avail_letters.length)]
        binding.pry
        used_letters << curr_letter
        avail_letters.delete(curr_letter)
    end
    return used_letters
end

draw_letters