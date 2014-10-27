class Card
  attr_reader :suit, :number

  def initialize(suit_and_number)
    @suit = suit_and_number[:suit]
    @number = suit_and_number[:number]
  end

  def print_suit_and_number
    puts @suit + @number
  end
end

card = Card.new({ suit: "D", number: "9" })
card.print_suit_and_number
