require_relative 'card'

class Deck

  attr_reader :cards
  
  def self.all_cards
    arr = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        arr << Card.new(suit, value)
      end
    end
    arr
  end

  def initialize(cards = Deck.all_cards.shuffle)
    @cards = cards
  end

  def count
    @cards.count
  end

end
