class Booking

  def self.create(property_id: , user_id:, start_date: , end_date:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings (property_id, user_id, start_date, end_date) VALUES($1, $2, $3, $4) RETURNING id, property_id, user_id, start_date, end_date;",
      [property_id, user_id, start_date, end_date]
      )
    Booking.new(id: result[0]['id'], property_id: result[0]['property_id'], user_id: result[0]['user_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'])
    }
  end

  attr_reader :id, :property_id, :user_id, :start_date, :end_date

  def initialize(id:, property_id:, user_id:, start_date:, end_date:)
    @id = id
    @property_id = property_id
    @user_id = user_id
    @start_date = start_date
    @end_date = end_date
  end
end