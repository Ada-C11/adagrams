
require "pry"
@letter_hash = {
  A: 9,
  B: 2,
  C: 2,
  D: 4,
  E: 12,
  F: 2,
  G: 3,
  H: 2,
  I: 9,
  J: 1,
  K: 1,
  L: 4,
  M: 2,
  N: 6,
  O: 8,
  P: 2,
  Q: 1,
  R: 6,
  S: 4,
  T: 6,
  U: 4,
  V: 2,
  W: 2,
  X: 1,
  Y: 2,
  Z: 1,
}
@points_hash = {
  A: 1,
  B: 3,
  C: 3,
  D: 2,
  E: 1,
  F: 4,
  G: 2,
  H: 4,
  I: 1,
  J: 8,
  K: 5,
  L: 1,
  M: 3,
  N: 1,
  O: 1,
  P: 3,
  Q: 10,
  R: 1,
  S: 1,
  T: 1,
  U: 1,
  V: 4,
  W: 4,
  X: 8,
  Y: 4,
  Z: 10,
}

@letter_array = []
@letter_hash.each do |letter, number|
  number.times do
    @letter_array.push(letter.to_s)
  end
end
puts "#{@letter_array}"
clone_array = @letter_array.clone

def draw_letters
  new_hand = []
  10.times do
    letter = @letter_array.sample
    new_hand.push(letter)
    @letter_array.delete_at(@letter_array.find_index(letter))
  end
  new_hand.each do |letter|
    @letter_array.push(letter)
  end
  puts new_hand
  return new_hand
end

# hand = draw_letters

def uses_available_letters?(input, letters_in_hand)
  input_array = input.upcase.split("").uniq
  input_array.each do |letter|
    if input_array.count(letter) > letters_in_hand.count(letter)
      return false
    end
    return true
  end
end

# puts uses_available_letters?("hello", draw_letters)

def score_word(word)
  points = 0
  word.each_char do |letter|
    puts letter
    points += @points_hash[letter.upcase.to_sym]
    puts @points_hash[letter.upcase.to_sym]
  end
  if word.length >= 7
    points += 8
  end
  return points
end

# puts "Total score: #{score_word("question")}"

# def highest_score_from_words(words)
#   # score_hash = Hash.new
#   score_array = words.map do |word|
#     { word =>
