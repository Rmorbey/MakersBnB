require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')

  # Clear the messages table
  connection.exec("TRUNCATE properties;")
end