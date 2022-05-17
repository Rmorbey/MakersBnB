require_relative '../lib/booking.rb'

describe Booking do
  describe ".create" do
    it "a user can create a booking" do
      booking = Booking.create(property_id: 1, start_date: '01/01/2022', end_date: '08/01/2022')

      result = DatabaseConnection.query("SELECT * FROM bookings")

      expect(result.first).to include booking
    end
  end
end