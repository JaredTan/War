require 'war'

describe War do

  describe "#initialize" do
    it "by default fills itself with an empty pile" do
      war = War.new('Pikachu', 'Charmander')
      expect(war.pile).to eq([])
    end

  end

end
