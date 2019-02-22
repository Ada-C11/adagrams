
# WAVE 1
LETTER_POOL = {a: 9, b: 2, c: 2, d: 4, e: 12, f: 2, g: 3, h: 2, i: 9, j: 1, k: 1, l: 4, m: 2,
               n: 6, o: 8, p: 2, q: 1, r: 6, s: 4, t: 6, u: 4, v: 2, w: 2, x: 1, y: 2, z: 1}

def draw_letters
  # Generate array of numbers
  letter_draw = LETTER_POOL.map do |key, value|
    (key.to_s * value).split("")
  end
  letter_draw.flatten!

  # .sample doesn't draw the same element twice
  user_hand = letter_draw.sample(10)
  return user_hand
end

# WAVE 2
# Determines whether input is valid (based on user hand)
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

# Score's the user's word
def score_word(word)
  # Add point values
  total_score = 0

  word.each_char do |char|
    SCORE_CHART.each do |score, letters|
      if letters.include?(char.downcase)
        total_score += score
      end
    end
  end

  # Add 8 points if word has >6 letters
  if word.length > 6
    total_score += 8
  end
  return total_score
end

# score = score_word(input)
# puts score

# WAVE 4
def tie_breaker(word, current_best, list)
  # Does the word have 10 letters?
  if word.length == 10 || word.length < current_best || list.index(word) < list.index(current_best)
    current_best = word
  end

  return current_best
end

def highest_score_from_words(words)

  # What is each word's score?
  all_scores = {}
  words.each do |word|
    score = score_word(word)
    all_scores[word] = score
  end

  best_word = ""
  best_score = 0
  # Which word(s) have the highest score?
  all_scores.each do |word, score|
    if score > best_score
      best_word = word
      best_score = score
    elsif score == best_score
      # BREAK THE TIE
    else
      # NOTHING, go on to next word!
    end
  end

  return best_word
end

# Make a tie-breaking method!

# Which word was supplied first?
# Is word's index less than best word's index?
# Yes - New best word!
# No - Nothing.  Best word remains unchanged.
