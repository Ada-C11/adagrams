
def draw_letters
  pool_letters = %w[A A A A A A A A A B B
    C C D D D D E E E E E E
    E E E E E E F F G G G H
    H I I I I I I I I I J K
    L L L L M M N N N N N N
    O O O O O O O O P P Q
    R R R R R R S S S S
    T T T T T T U U U U
    V V W W X Y Y Z]

letters = pool_letters 
letters.shuffle
letters_in_hand = letters.sample(10)
return letters_in_hand
end


def uses_available_letters?(input, letters_in_hand)
  input.each_char do |letter|
    index = letters_in_hand.index(letter.upcase)
    if index.nil?
        return false
    else
        letters_in_hand.delete_at(index)
    end
  end
return true
end

def score_word(word)
score_value = { A: 1, B: 3, C: 3, D: 2, E: 1, F: 4,G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10 , R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10 }
scored = 0 
word = word.upcase
word.each_char do |letter|
scored += score_value[letter.to_sym].to_i
end
if word.length > 6 
  scored += 8
end
return scored 
end

def highest_score_from(words)
  record_hash = {
    word: "",
    score:
  }
  words.each do |word|

