# array_of_letters = ["d", "o", "o", "g"]
# string = "dog"
# string_to_array = string.split("")

# leftovers = array_of_letters - string_to_array

# if (array_of_letters.length - string.length) == leftovers.length
#   puts "all the letters were available"
# else
#   puts "they weren't"
# end

longest = %w{ cat sheep bear }.reduce do |memo, word|
  puts "memo: #{memo}"
  puts "word: #{word}"
  memo.length > word.length ? memo : word
end

puts longest
