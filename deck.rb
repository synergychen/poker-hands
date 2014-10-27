require "./card"
class Deck
  def initialize(suits, numbers)
    @suits = suits
    @numbers = numbers
    @cards = []
  end

  def cards_list
    @suits.each do |suit|
      @numbers.each do |number|
        @cards << Card.new({ number: number, suit: suit })
      end
    end
  end

  def print_cards
    @cards.shuffle.each do |card|
      card.print_suit_and_number
    end
  end
end

numbers = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
suits = ["D", "H", "C", "S"]

deck = Deck.new(suits, numbers)
deck.cards_list
deck.print_cards
