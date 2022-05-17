require 'property'

describe Property do
  describe '.add' do
    it 'can add a property' do
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com')

      connection = PG.connect(dbname: 'makers_bnb_test')
      persisted_data = connection.query("SELECT * FROM properties WHERE id=#{property.id}")

      p persisted_data.first
      expect(persisted_data.first['contact']).to include property.contact
    end
  end

  describe '.view_all' do
    it 'displays all the properties' do
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com')
      Property.add(description: 'studio flat', contact: 'luiza@makersbnb.com')

      properties = Property.view_all
      
      expect(properties.length).to eq 2
    end
  end
end