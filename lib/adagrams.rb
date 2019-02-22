require 'awesome_print'
require 'pry'

def draw_letters
    letters = [
        "A", "A", "A", "A", "A", "A", "A", "A", "A", 
        "B", "B",
        "C", "C",
        "D", "D", "D", "D",
        "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
        "F", "F",
        "G", "G", "G",
        "H", "H",
        "I", "I", "I", "I", "I", "I","I", "I", "I",
        "J",
        "K",
        "L", "L", "L", "L",
        "M", "M",
        "N", "N", "N", "N", "N", "N",
        "O", "O", "O", "O", "O", "O", "O", "O",
        "P", "P",
        "Q",
        "R", "R", "R", "R", "R", "R",
        "S", "S", "S", "S",
        "T", "T", "T", "T", "T", "T",
        "U", "U", "U", "U",
        "V", "V",
        "W", "W",
        "X",
        "Y", "Y",
        "Z"
    ]

    return letters.sample(10)

end


def uses_available_letters?(input, letters_in_hand)
    input.each_char do |letter|
        index = letters_in_hand.index(letter)
        if index.nil?
            return false
        else
            letters_in_hand.delete_at(index)
        end
    end
    return true
end

def score_word (word)
  score = 0
  word.upcase.each_char do |letter|
  
  case letter
  when "A", 'E', 'I', 'O', 'U', 'L', 'R', 'N', 'S', 'T' 
    score += 1
  when 'D', 'G'
    score += 2
  when 'B', 'C', 'M', 'P'
    score += 3
  when 'F', 'H', 'V', 'W', 'Y'
    score += 4
  when 'K'
    score += 5
  when 'J', 'X' 
    score += 8
  when 'Q', 'Z'
    score += 10
  end
  end

  if word.length > 6 && word.length < 11
    score += 8
  end

  return score

end


def highest_score_from (words)

   score_list = words.map do |element| 
    { word: element, score: score_word(element) }
  end 

find_best_word = []
max = 0

score_list.each do |element|
  if element[:score] > max
    find_best_word = [element]
    max = element[:score]
  elsif element[:score] == max
    find_best_word << element
  end
end

winner = []
longest = find_best_word[0][:word].length

find_best_word.each do |entry|
  if entry[:word].length < longest
    winner = [entry]
    longest = entry[:word].length
  elsif entry[:word].length == longest 
    winner << entry
  end
end
p winner
return winner.first
end

result = ["cang", "birrr"]
highest_score_from(result)
