array_of_letters = ["a", "c", "d", "b", "e", "g", "e", "a", "g", "q"]
string = "beets"
string_to_array = string.split("")

leftovers = array_of_letters - string_to_array

if (array_of_letters.length - string.length) == leftovers.length
  puts "all the letters were available"
else
  puts "they weren't"
end
