require_relative '../lib/booking.rb'
require_relative '../lib/user.rb'
require_relative '../lib/property.rb'

describe Booking do
  describe ".create" do
    it "a user can create a booking" do
      url = 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'

      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: url)
      booking = Booking.create(property_id: 1, user_id: 1, start_date: '01/01/2022', end_date: '08/01/2022')
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')

      result = DatabaseConnection.query("SELECT * FROM bookings")
      p result
      expect(result.first).to include booking
    end
  end
end