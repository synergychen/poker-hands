require "./card"

class HighestHand
  def initialize(cards)
    @cards = cards
    @suits = @cards.map { |card| card.suit }
    @transferred_numbers = @cards.map { |card| string_to_new_number(card.number) }
    @number_of_cards = 5
  end

  def get_result
    # puts uniq_numbers_count
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
      puts "high card"
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

  def uniq_numbers
    @transferred_numbers.uniq.sort
  end

  def uniq_numbers_count
    uniq_numbers.map do |number|
      @transferred_numbers.count(number)
    end
  end

  def string_to_new_number(number)
    if number == "T"
      10
    elsif number == "J"
      11
    elsif number == "Q"
      12
    elsif number == "K"
      13
    elsif number == "A"
      14
    else
      number.to_i
    end
  end

  def same_suit?
    @suits.uniq.count == 1
  end
end
