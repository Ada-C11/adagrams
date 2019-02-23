require "pry"

# WAVE 1
LETTER_POOL = {a: 9, b: 2, c: 2, d: 4, e: 12, f: 2, g: 3, h: 2, i: 9, j: 1, k: 1, l: 4, m: 2,
               n: 6, o: 8, p: 2, q: 1, r: 6, s: 4, t: 6, u: 4, v: 2, w: 2, x: 1, y: 2, z: 1}

def draw_letters
  letter_draw = LETTER_POOL.map do |key, value|
    (key.to_s * value).split("")
  end
  letter_draw.flatten!

  user_hand = letter_draw.sample(10)
  return user_hand
end

# WAVE 2
def uses_available_letters?(input, letters_in_hand)
  uses_available_letters = true
  input.each_char do |letter|
    user_count = input.count(letter)
    hand_count = letters_in_hand.count(letter)
    if user_count > hand_count
      uses_available_letters = false
      break
    end
  end
  return uses_available_letters
end

# WAVE 3
SCORE_CHART = {1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
               2 => ["d", "g"],
               3 => ["b", "c", "m", "p"],
               4 => ["f", "h", "v", "w", "y"],
               5 => ["k"],
               8 => ["j", "x"],
               10 => ["q", "z"]}

def score_word(word)
  total_score = 0

  word.each_char do |char|
    SCORE_CHART.each do |score, letters|
      if letters.include?(char.downcase)
        total_score += score
      end
    end
  end

  if word.length > 6
    total_score += 8
  end
  return total_score
end

def tie_breaker(word, current_best, list)
  new_best = current_best
  if word.length == current_best.length
    if list.index("#{word}") < list.index("#{current_best}")
      new_best = word
    end
  elsif word.length == 10
    new_best = word
  elsif word.length < current_best.length
    new_best = word
  end
  return new_best
end

def highest_score_from(words)
  all_scores = {}
  words.each do |word|
    score = score_word(word)
    all_scores[word] = score
  end

  best_word = ""
  best_score = 0
  all_scores.each do |word, score|
    if word.length == 10
      best_word = word
      best_score = score
      break
    elsif score > best_score
      best_word = word
      best_score = score
    elsif score == best_score
      best_word = tie_breaker(word, best_word, words)
    end
  end

  winner = {word: best_word, score: best_score}
  return winner
end
