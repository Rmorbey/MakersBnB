require 'pg'

class Property

  attr_reader :id, :description, :contact, :picture_url
  
  def initialize(id:, description:, contact:, picture_url:)
    @id = id
    @description = description
    @contact = contact
    @picture_url = picture_url
  end

  def self.add(description:, contact:, picture_url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec_params(
      'INSERT INTO properties (description, contact, picture_url) VALUES($1, $2, $3) RETURNING id, description, contact, picture_url;', [description, contact, picture_url]
      )
    Property.new(id: result[0]['id'], description: result[0]['description'], contact: result[0]['contact'], picture_url: result[0]['picture_url'])
  end

  def self.view_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec('SELECT * FROM properties;')
    result.map do |property| 
      Property.new(id: property['id'], description: property['description'], contact: property['contact'], picture_url: property['picture_url'])
    end
  end

end
