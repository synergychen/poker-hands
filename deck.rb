require "./card"

class Deck
  attr_reader :cards
  def initialize(suits, numbers)
    @suits = suits
    @numbers = numbers
    @cards = []
  end

  def get_deck
    generate_cards
    shuffle_cards
  end

  def print_cards
    @cards.shuffle.each do |card|
      card.print_suit_and_number
    end
  end

  private

  def generate_cards
    @suits.each do |suit|
      @numbers.each do |number|
        @cards << Card.new({ number: number, suit: suit })
      end
    end
  end

  def shuffle_cards
    @cards = @cards.shuffle
  end
end

# numbers = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
# suits = ["D", "H", "C", "S"]
#
# deck = Deck.new(suits, numbers)
