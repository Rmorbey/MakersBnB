require 'pg'

class Property

  attr_reader :id, :description, :contact, :picture_url, :user_id, :price_per_night
  
  def initialize(id:, description:, contact:, picture_url:, price_per_night:, user_id:)
    @id = id
    @description = description
    @contact = contact
    @picture_url = picture_url
    @price_per_night = price_per_night
    @user_id = user_id
  end

  def self.add(description:, contact:, picture_url:, user_id:, price_per_night:)
    result = DatabaseConnection.query(
      'INSERT INTO properties (description, contact, picture_url, user_id, price_per_night) VALUES($1, $2, $3, $4, $5) RETURNING id, description, contact, picture_url, price_per_night;', [description, contact, picture_url, user_id, price_per_night]
      )
    Property.new(id: result[0]['id'], description: result[0]['description'], contact: result[0]['contact'], picture_url: result[0]['picture_url'], price_per_night: result[0]['price_per_night'], user_id: result[0]['user_id'])
  end

  def self.view_all
    result = DatabaseConnection.query('SELECT * FROM properties;')
    result.map do |property| 
      Property.new(id: property['id'], description: property['description'], contact: property['contact'], picture_url: property['picture_url'], price_per_night: property['price_per_night'], user_id: property['user_id'])
    end
  end

  def self.find_by_user(id:)
      return nil unless id
      result = DatabaseConnection.query("SELECT * FROM properties WHERE user_id = $1", [id])
      Property.new(id: result[0]['id'], description: result[0]['description'], contact: result[0]['contact'], picture_url: result[0]['picture_url'], price_per_night: result[0]['price_per_night'], user_id: result[0]['user_id'])
      
  end

end
