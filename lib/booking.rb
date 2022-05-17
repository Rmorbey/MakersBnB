class Booking

  def self.create(property_id: , user_id:, start_date: , end_date:)

    result = DatabaseConnection.query("INSERT INTO bookings (property_id, user_id, start_date, end_date) VALUES($1, $2, $3, $4) RETURNING id, property_id, user_id, start_date, end_date;",
        [id, property_id, user_id, start_date, end_date]
        )

  end

end