require 'pg'

class Property

  attr_reader :id, :description, :contact, :picture_url
  
  def initialize(id:, description:, contact:, picture_url:)
    @id = id
    @description = description
    @contact = contact
    @picture_url = picture_url
  end

  def self.add(description:, contact:, picture_url:, user_id:)
    result = DatabaseConnection.query(
      'INSERT INTO properties (description, contact, picture_url, user_id) VALUES($1, $2, $3, $4) RETURNING id, description, contact, picture_url;', [description, contact, picture_url, user_id]
      )
    Property.new(id: result[0]['id'], description: result[0]['description'], contact: result[0]['contact'], picture_url: result[0]['picture_url'])
  end

  def self.view_all
    result = DatabaseConnection.query('SELECT * FROM properties;')
    result.map do |property| 
      Property.new(id: property['id'], description: property['description'], contact: property['contact'], picture_url: property['picture_url'])
    end
  end

end
