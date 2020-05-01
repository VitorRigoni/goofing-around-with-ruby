require_relative '../animal'

RSpec.describe Animal do
  context 'Boby' do
    
    it "expects cat name to be Boby" do
      cat = Cat.new
      expect(cat.name).to eql 'Boby'
    end

    it 'expects cat to meow' do
      cat = Cat.new
      expect(cat.meow()).to eq("meow")
    end

  end
end