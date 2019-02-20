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

user_hand = draw_letters
print user_hand
