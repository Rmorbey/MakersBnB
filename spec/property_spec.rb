require 'property'

describe Property do
  describe '.add' do
    it 'can add a property' do
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', price_per_night: '£30', picture_url: url, user_id: user.id)

      connection = PG.connect(dbname: 'makers_bnb_test')
      persisted_data = connection.query("SELECT * FROM properties WHERE id=#{property.id}")

      expect(persisted_data.first['contact']).to include property.contact
    end
  end

  describe '.view_all' do
    it 'displays all the properties' do
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
      user1 = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      user2 = User.create(name: 'Archie Parchie', email: 'puddingandpie@hotmail.com', password: 'password123')

      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', price_per_night: '£30', picture_url: url, user_id: user1.id)
      Property.add(description: 'studio flat', contact: 'luiza@makersbnb.com', price_per_night: '£30', picture_url: url, user_id: user2.id)

      properties = Property.view_all
      
      expect(properties.length).to eq 2
    end
  end

  describe '.find_by_user' do
    it 'returns nil if no ID is given' do
      expect(Property.find_by_user(id: nil)).to eq nil
    end

    it 'finds a property by user id' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: "https://imgur.com/uhj0V41", price_per_night: '30', user_id: user.id)
      result = Property.find_by_user(id: user.id)
      expect(result.first.user_id).to eq user.id
    end
  end

  describe '.find_by_property_id' do
    it 'finds a property by property id' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: "https://imgur.com/uhj0V41", price_per_night: '30', user_id: user.id)
      result = Property.find_by_property_id(id: property.id)
      expect(result.first.id).to eq property.id
    end
  end
end
