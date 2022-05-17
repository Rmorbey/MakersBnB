require 'pg'

class Users

  attr_reader :id, :username
  
  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.add(username)
    result = DatabaseConnection.query(
      'INSERT INTO users (username) VALUES($1) RETURNING id, username;', [username]
      )
    Users.new(id: result[0]['id'], username: result[0]['username'])
  end
end
