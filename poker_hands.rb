require "./card"
require "./deck"

class PokerHands
  def initialize(deck)
    @cards = deck.cards
  end

  def play
    (1..4).each do |player_number|
      run_player(player_number)
    end
  end

  def run_player(player_number)
    puts "Player #{player_number}"
    puts "--------"
    player_cards = pick_up_five_cards_from_deck
    print_hands(player_cards)
  end

  private

  def pick_up_five_cards_from_deck
    @cards.pop(5)
  end

  def print_hands(cards)
    cards.each do |card|
      puts card.suit + card.number
    end
  end

  def print_left_cards_number
    puts @cards.count.to_s + " cards left."
  end
end

numbers = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
suits = ["D", "H", "C", "S"]

deck = Deck.new(suits, numbers)
deck.get_deck

poker_hands = PokerHands.new(deck)
poker_hands.play
