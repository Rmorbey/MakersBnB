require 'property'

describe Property do
  describe '.add' do
    it 'can add a property' do
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: url)

      connection = PG.connect(dbname: 'makers_bnb_test')
      persisted_data = connection.query("SELECT * FROM properties WHERE id=#{property.id}")

      expect(persisted_data.first['contact']).to include property.contact
    end
  end

  describe '.view_all' do
    it 'displays all the properties' do
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: url)
      Property.add(description: 'studio flat', contact: 'luiza@makersbnb.com', picture_url: url)

      properties = Property.view_all
      
      expect(properties.length).to eq 2
    end
  end
end