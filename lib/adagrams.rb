POOL = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", 
 "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", 
 "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", 
 "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K",
 "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N",
 "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", 
 "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", 
 "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", 
 "V", "V", "W", "W", "X", "Y", "Y", "Z"]

# add welcome message etc 
def welcome_message
    puts "Welcome Message"


def draw_letters(array)
array.shuffle
return list = array.sample(10)
end 
      
list = draw_letters(POOL)
puts "This are the letter you have drawn #{list.join(', ')}"

# Wave 2 
puts "enter a word" 
word = gets.chomp.upcase  

#Returns true if every letter in the input word is available
# (in the right quantities) in the letters_in_hand
#Returns false if not; if there is a letter in input 
#that is not present in the letters_in_hand or has too 
#much of compared to the letters_in_hand
def uses_available_letters?(input, letters_in_hand)
 chars = input.split("")
 puts "#{chars}"
 chars.each do |item|
    if letters_in_hand.include?(item) == false
        puts "not working"
       return false
    elsif letters_in_hand.include?(item) == true
       letters_in_hand.delete(item)

end
end
puts "yes"
return true
end

uses_available_letters?(word, list)    