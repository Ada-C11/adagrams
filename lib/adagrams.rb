
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

# user_hand = draw_letters
# print user_hand

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

# WAVE 2 and 3 TESTERS
input = "aeioulnrst"
letters_in_hand = ["d", "i", "g", "s"].shuffle

result = uses_available_letters?(input, letters_in_hand)
puts result

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
      if letters.include?(char)
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

score = score_word(input)
puts score

# WAVE 4
