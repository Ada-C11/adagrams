require "awesome_print"

def draw_letters
  avail_letters = %w[A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z]
  avail_letters.sample(10)
end

sample = draw_letters
# print sample

def uses_available_letters?(input, letters_in_hand)
  input = input.upcase
  input.each_char.all? do |char|
    if letters_in_hand.include?(char)
      letters_in_hand.delete_at(letters_in_hand.index(char))
      true
    else
      false
    end
  end
end

# user_input = gets.chomp.upcase
# p uses_available_letters?(user_input, sample)

def score_word(word)
  score = []
  score_chart = [%w[A E I O U L N R S T], %w[D G], %w[B C M P], %w[F H V W Y], %w[K]]
  word = word.upcase

  score_chart.each_with_index do |letter_bank, letter_value|
    word.each_char do |char|
      if letter_bank.include?(char)
        score << (letter_value + 1)
      end
    end
  end

  word.each_char do |char|
    if ["J", "X"].include?(char)
      score << 8
    elsif ["Q", "Z"].include?(char)
      score << 10
    end
  end

  if word.length > 6
    score << 8
  end

  return score.sum
end

def highest_score_from(words)
  scored_words = []

  words.each do |played_word|
    played_word = played_word.upcase
    scored_words <<
    {
      each_word: played_word, each_score: score_word(played_word),
    }
  end

  high_score = scored_words.max_by { |point|
    point[:each_score]
  }[:each_score]

  highest_scored_words = scored_words.select { |semi_finalist|
    semi_finalist[:each_score] == high_score
  }.map { |semi_finalist|
    semi_finalist[:each_word]
  }

  if highest_scored_words.length == 1
    return ultimate_winner = {word: highest_scored_words[0], score: high_score}
  elsif highest_scored_words.length > 1
    winner = highest_scored_words.find { |ten| ten.length == 10 }
    return {word: winner, score: high_score} if winner
  end
  return {word: highest_scored_words.min_by { |highest| highest.length }, score: high_score}
end

# def is_in_english_dict?(input)
#   require "csv"
#   dictionary_array = []
#   CSV.foreach("assets/dictionary-english.csv") do |row|
#     dictionary_array << row
#   end
#   dictionary_array.flatten!
#   return dictionary_array.include?(input) ? true : false
# end
