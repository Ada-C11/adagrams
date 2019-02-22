def draw_letters()
  pool_letters = "aaaaaaaaabbccddddeeeeeeeeeeeeffggghhiiiiiiiiijkllllmmnnnnnnooooooooppqrrrrrrssssttttttuuuuvvwwxyyz".split("")
  hand = []
  10.times do
    index = rand(pool_letters.length)
    random_letter = pool_letters[index]
    hand.push(random_letter)
    pool_letters.delete_at(index)
  end
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  input.each_char do |char|
    if letters_in_hand.include?(char)
      letters_in_hand.each_with_index do |letter, i|
        letters_in_hand.delete_at(i) if letter == char
      end
    else
      return false
    end
  end
  return true
end
