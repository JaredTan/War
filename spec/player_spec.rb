require 'player'

describe Player do
  subject(:player) do
    Player.new("Jard the potato")
  end

  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen)
    ]
  end

  it "assigns the name" do
    expect(player.name).to eq("Jard the potato")
  end
  it "assigns an empty deck" do
    expect(player.deck).to eq([])
  end

  describe "#pay_pile" do
    it "adds the pile to the player's deck" do
      player.pay_pile(cards)

      expect(player.deck).to eq(cards)
    end
  end

  describe "#take_top_card" do

    it "takes a card from the top of the deck" do
      player.pay_pile(cards)
      new_card = player.take_top_card
      expect(new_card).to eq(cards[0])
    end

  end

end
