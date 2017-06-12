
class Player

  attr_reader :name
  attr_accessor :deck

  def initialize(name)
    @name = name
    @deck = []
  end

  def pay_pile(pile)
    @deck += pile
  end

  def take_top_card
    @deck.shift(1).first
  end

  def count
    @deck.count
  end

  def empty?
    count.zero?
  end

end
