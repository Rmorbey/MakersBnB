require 'property'

describe Property do
  describe '.add' do
    it 'can add a property' do
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com')
      expect(Property.all).to include property
    end
  end
end