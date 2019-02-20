
def draw_letters
  available_letters = {"a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h" => 2,
                       "i" => 9, "j" => 1, "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2,
                       "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1,
                       "y" => 2, "z" => 1}
  drawn_letters = []
  10.times do
    letter = available_letters.keys.sample
    while available_letters[letter] == 0
      letter = available_letters.keys.sample
    end
    drawn_letters.push(letter)
    available_letters[letter] = available_letters[letter] - 1
  end
  return drawn_letters
end
