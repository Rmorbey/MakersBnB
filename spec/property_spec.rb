require 'property'

describe Property do
  describe '.add' do
    it 'can add a property' do
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com')
      expect(Property.view_all).to include property
    end
  end

  describe '.view_all' do
    it 'displays all the properties' do
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com')
      Property.add(description: 'studio flat', contact: 'luiza@makersbnb.com')

      properties = Property.view_all
      p properties
      
      expect(properties.length).to eq 2
    end
  end
end