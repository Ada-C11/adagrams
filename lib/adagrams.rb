# Wave 1 [Question 1 - Creating Data Structure]

def draw_letters
    pool_of_letters = [
    "A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"
]
    my_letters = []
    random_letter = pool_of_letters.shuffle
    10.times do
        my_letters.push(random_letter[-1])
        random_letter.pop
    end
    return my_letters
end 

def uses_available_letters?(input, letters_in_hand)
    word = input.upcase.split(//)
    if word.length <= 10
        word.each do |each_letter_in_word|
            if !letters_in_hand.include?(each_letter_in_word) 
                return false
            end  
                letters_in_hand.delete_at(letters_in_hand.index(each_letter_in_word))
        end
        return true  
    else
        return false    
    end
end


def score_word(word)
    letter_points = {
        "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4, "G" => 2, "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1, "M" => 3, "N" => 1, "O" => 1, "P" => 3, "Q"=> 10, "R"=> 1, "S" => 1, "T" => 1, "U" => 1, "V" => 4, "W" => 4, "X" => 8, "Y" => 4, "Z" => 10
    }
    word_to_score = word.upcase.split(//)
    score = word_to_score.map do |each_letter|
        letter_points[each_letter]
    end
    my_score = score.inject(0) do |total_score, letter_value|
        total_score + letter_value
    end
    if word_to_score.length > 6
        my_score += 8
    end

    return my_score
end