require 'war'

describe War do
  subject(:war) { War.new('Pikachu', 'Charmander') }

  describe "#initialize" do
    it "by default fills itself with an empty pile" do
      expect(war.pile).to eq([])
    end

  end

    describe '#distribute_deck' do
      it 'alternatively gives cards to the players' do
        war.distribute_deck
        expect(war.player_one.count).to eq(26)
      end
    end

    describe '#play_turn' do
      it 'calls #draw' do
        expect(war).to receive(:draw)
        war.play_turn
      end

    end
end
