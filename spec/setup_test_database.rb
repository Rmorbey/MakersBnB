require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')

  # Clear the properties and users table
  connection.exec("TRUNCATE properties, users, bookings;")
end