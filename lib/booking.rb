class Booking

  def self.create(property_id: , user_id:, start_date: , end_date:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings (property_id, user_id, start_date, end_date) VALUES($1, $2, $3, $4) RETURNING id, property_id, user_id, start_date, end_date;",
      [property_id, user_id, start_date, end_date]
      )
    Booking.new(id: result[0]['id'], property_id: result[0]['property_id'], user_id: result[0]['user_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'], confirmed: result[0]['confirmed'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'], confirmed: result[0]['confirmed'])
    }
  end

  def self.requested
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE confirmed=false")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'], confirmed: result[0]['confirmed'])
    }
  end

  def self.confirmed
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE confirmed=true")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'], confirmed: booking['confirmed'])
    }
  end

  
  def self.find_requests_by_property_id(id:)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE property_id='#{id}'")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'], confirmed: result[0]['confirmed'])
    }
  end

  def self.find_requests_by_user_id(id:)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE user_id='#{id}'")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'], confirmed: result[0]['confirmed'])
    }
  end

  attr_reader :id, :property_id, :user_id, :start_date, :end_date, :confirmed
  
  def initialize(id:, property_id:, user_id:, start_date:, end_date:, confirmed:)
    @id = id
    @property_id = property_id
    @user_id = user_id
    @start_date = start_date
    @end_date = end_date
    @confirmed = confirmed
  end

  def accept 
    DatabaseConnection.query(
      "UPDATE bookings SET confirmed='true' WHERE property_id=$1",
      [@property_id]
    )
    @confirmed = true
  end

  def self.confirmed_property_id(id:)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE confirmed=true AND property_id='#{id}'")
    result.map { |booking|
      Booking.new(id: booking['id'], property_id: booking['property_id'], user_id: booking['user_id'], start_date: booking['start_date'], end_date: booking['end_date'], confirmed: booking['confirmed'])
   }
  end
end
