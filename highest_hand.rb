class HighestHand
  CARD_NUMBERS_OF_A_SUIT = 13
  CARD_NUMBERS_HASH = {
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "T" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  def initialize(cards)
    @cards = cards
    @suits = @cards.map { |card| card.suit }
    @transferred_numbers = @cards.map { |card| string_to_number(card.number) }
    @number_of_cards = PokerHands::NUMBER_OF_CARDS
  end

  def get_result
    if straight_flush?
    elsif four_of_a_kind?
      puts "four of a kind"
    elsif full_house?
      puts "full house"
    elsif straight?
      puts "straight"
    elsif three_of_a_kind?
      puts "three of a kind"
    elsif two_pair?
      puts "two pairs"
    elsif one_pair?
      puts "one pair"
    else
      print_highest_card_value
    end
  end

  private

  def straight_flush?
    same_suit? && straight?
  end

  def four_of_a_kind?
    uniq_numbers_count.include?(4)
  end

  def full_house?
    uniq_numbers_count.include?(3) && uniq_numbers_count.include?(2)
  end

  def flush?
    same_suit?
  end

  def straight?
    if uniq_numbers.count == @number_of_cards
      (uniq_numbers[-1] - uniq_numbers[0]) == (@number_of_cards - 1)
    end
  end

  def three_of_a_kind?
    uniq_numbers_count.include?(3)
  end

  def two_pair?
    if uniq_numbers_count.include?(2)
      uniq_numbers_count.count == (@number_of_cards - 2)
    end
  end

  def one_pair?
    if uniq_numbers_count.include?(2)
      uniq_numbers_count.count == (@number_of_cards - 1)
    end
  end

  def print_highest_card_value
    print "High card: "
    number_to_string(@transferred_numbers.sort[-1])
  end

  def uniq_numbers
    @transferred_numbers.uniq.sort
  end

  def uniq_numbers_count
    uniq_numbers.map do |number|
      @transferred_numbers.count(number)
    end
  end

  def string_to_number(string)
    CARD_NUMBERS_HASH["#{string}"]
  end

  def number_to_string(number)
    result = []
    CARD_NUMBERS_HASH.each do |k, v|
      if number == v
        result << k
      end
    end
    result.first
  end

  def same_suit?
    @suits.uniq.count == 1
  end
end
