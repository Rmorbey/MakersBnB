require_relative '../lib/booking.rb'
require_relative '../lib/user.rb'
require_relative '../lib/property.rb'

describe Booking do
  describe ".create" do
    it "a user can create a booking" do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: url, user_id: user.id)    
      booking = Booking.create(property_id: property.id, user_id: user.id, start_date: '01/01/2022', end_date: '08/01/2022')

      result = DatabaseConnection.query("SELECT * FROM bookings")

      expect(booking).to be_a Booking
      expect(booking.id).to eq result[0]['id']
      expect(booking.property_id).to eq result[0]['property_id']
      expect(booking.user_id).to eq result[0]['user_id']
      expect(booking.start_date).to eq '2022-01-01'
      expect(booking.end_date).to eq '2022-08-01'
    end
  end

  describe '.all' do
    it 'returns all bookings' do
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: url)
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      booking = Booking.create(property_id: property.id, user_id: user.id, start_date: '01/01/2022', end_date: '08/01/2022')

      result = DatabaseConnection.query("SELECT * FROM bookings")

      expect(Booking.all.first.id).to eq booking.id
    end
  end
end