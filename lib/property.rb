require 'pg'

class Property
  def self.add(description:, contact:)
    connection = PG.connect(dbname: 'makers_bnb_test')
    result = connection.exec_params("INSERT INTO properties (description, contact) VALUES($1, $2) RETURNING id, description, contact;",
    [description, contact]
    )
    result[0]
  end

  def self.all
    connection = PG.connect(dbname: 'makers_bnb_test')
    result = connection.exec_params("SELECT * FROM properties;")
    result.map do |property| 
      p property
    end
  end
end