require_relative 'player'
require_relative 'deck'

class War

  attr_reader :player_one, :player_two, :pile

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @pile = []
    @deck = Deck.new
  end

  def play
    distribute_deck
    until @player_two.empty? || @player_one.empty?
      play_turn
    end
    conclude
  end

  def distribute_deck
    @deck.cards.each_with_index do |card, idx|
      @player_one.deck << card if idx.even?
      @player_two.deck << card if idx.odd?
    end
  end

  def play_turn
    round_winner = draw
    if round_winner == :tie
      war!
    else
      round_winner.pay_pile(@pile)
      @pile = []
    end
  end

  def draw
    case check_top_cards
    when -1
      return @player_two
    when 0
      return :tie
    when 1
      return @player_one
    end
  end

  def check_top_cards
    p1_card = @player_one.take_top_card
    p2_card = @player_two.take_top_card
    @pile << p1_card
    @pile << p2_card

    display(p1_card, p2_card)

    p1_card.war_value <=> p2_card.war_value
  end

  def war!
    p1_card = @player_one.take_top_card
    p2_card = @player_two.take_top_card
    @pile << p1_card
    @pile << p2_card

    check_top_cards unless over?

  end


  def display(p1_card, p2_card)
    puts "\n#{@player_one.name}'s card: #{p1_card.to_s}"
    puts "#{@player_two.name}'s card: #{p2_card.to_s}"
    puts "\n\nPile:"
    @pile.each do |card|
      print "#{card.to_s} "
    end
    puts "\n\n#{@player_one.name}'s card count: #{@player_one.count}"
    puts "#{@player_two.name}'s card count: #{@player_two.count}\n"
    puts "_________________________________"
    sleep(0.2)
  end

  def over?
    @player_two.empty? || @player_one.empty?
  end

  def conclude
    if @player_two.deck.empty?
      puts "#{@player_one.name} is the winner!"
    else
      puts "#{@player_two.name} is the winner!"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  print "Your name?: "
  p1 = Player.new(gets.chomp)
  # print "Player 2 name?: "
  p2 = Player.new('Jard')

  War.new(p1, p2).play
end
