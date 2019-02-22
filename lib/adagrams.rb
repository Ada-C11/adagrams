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
