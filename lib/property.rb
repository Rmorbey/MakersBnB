require 'pg'

class Property
  def self.add(description:, contact:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec_params("INSERT INTO properties (description, contact) VALUES($1, $2) RETURNING id, description, contact;",
    [description, contact]
    )
    Property.new(id: result[0]['id'], description: result[0]['description'], contact: result[0]['contact'])
  end

  def self.view_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec_params("SELECT * FROM properties;")
    result.map do |property| 
      Property.new(id: property['id'], description: property['description'], contact: property['contact'])
    end
  end

  attr_reader :id, :description, :contact
  def initialize(id:, description:, contact:)
    @id = id
    @description = description
    @contact = contact
  end
end