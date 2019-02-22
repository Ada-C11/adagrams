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

def score_word(word)
  score_chart = Hash.new(0)
  score_chart = { a: 1, e: 1, i: 1, o: 1, u: 1, n: 1, r: 1, s: 1, t: 1, d: 2, g: 2, l: 1,
                  b: 3, c: 3, m: 3, p: 3, f: 4, h: 4, v: 4, w: 4, y: 4, k: 5, j: 8, x: 8, q: 10, z: 10 }
  score = 0
  word.downcase.each_char do |char|
    # p score_chart[char.to_sym]
    score += score_chart[char.to_sym]
  end
  if word.length == 7 || word.length == 8 || word.length == 9 || word.length == 10
    score += 8
  end
  return score
end

def highest_score_from(words)
  scores = []
  words.each do |word|
    scores << { word: word,
               score: score_word(word) }
  end
  temp = scores[0]
  scores.each do |current|
    if temp[:score] < current[:score]
      temp = current
    elsif temp[:score] == current[:score]
      if (current[:word].length == 10 || current[:word].length < temp[:word].length) && temp[:word].length != 10
        temp = current
      end
    end
  end
  return temp
end
