# # Wave 1

def create_letters
  letter_config = {
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
    Z: 1
    }
    number = []
    letter_config.each do |letter, quantity|
      quantity.times do
        number.push(letter.to_s)
      end
    end
    number
  end
  
  # print create_letters
  
  def draw_letters
    number = create_letters
    number.sample(10)
  end
  
  # # Wave 2
  
  def get_user_word
    puts 'Enter your word'
    user_input = gets.chomp.upcase
    user_input.split('')
  end
  
  def uses_available_letters?(input, letters_in_hand)
    input & letters_in_hand == input
  end
  
  def store_word (word)
    score_chart = {
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
      Z: 10
    }
  
    score = 0
  
    word.each do |letter|
      case letter
      when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
        score += 1
      when "D", "G"
        score += 2
      when "B", "C", "M", "P"
        score += 3
      when "F", "H", "G", "W", "Y"
        score += 4
      when "K"
        score += 5
      when "J", "X"
        score += 8
      when "Q", "Z"
        score += 10
      end
    end
  end
  
  puts score_word(get_user_word)
  
  # def run_game
  #   display_welcome_message
  
  #   drawn_letters = draw_letters
  #   display_drawn_letters(drawn_letters)
  
  #   user_word = get_user_word
  #   puts uses_available_letters?(user_word, drawn_letters)
  #   puts store_word(get_user_word)
  # end
  
  # run_game