# Wave 1 [Question 1 - Creating Data Structure]

# POOL_OF_LETTERS = [ 
#     {A: 9}, {N: 6},
#     {B: 2}, {O: 8},
#     {C: 2}, {P: 2},
#     {D: 4}, {Q: 1},
#     {E: 12}, {R: 6},
#     {F: 2}, {S: 4},
#     {G: 3}, {T: 6},
#     {H: 2}, {U: 4},
#     {I: 9}, {V: 2},
#     {J: 1}, {W: 2},
#     {K: 1}, {X: 1},
#     {L: 4}, {Y: 2},
#     {M: 2}, {Z: 1}
# ]

$POOL_OF_LETTERS = [
    "A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"
]

def draw_letters
    my_letters = []
    10.times do
    random_letter = $POOL_OF_LETTERS.shuffle
    my_letters.push(random_letter[-1])
    random_letter.pop
    end
    return my_letters
end 

def uses_available_letters?(input, letters_in_hand)
    word = input.split(//)
    
    if word.length <= 10
        word.each do |each_letter_in_word|
            if !letters_in_hand.include?(each_letter_in_word)
                return false 
            end
            letters_in_hand.delete(each_letter_in_word)
        end
        return true  
    else
        return false    
    end
end

drawn_letters = draw_letters
print "Your 10 letters are #{ drawn_letters }."

puts "Please make the best work with the letters you were dealt."
    new_word = gets.chomp.to_s.upcase

uses_available_letters?(new_word, drawn_letters)