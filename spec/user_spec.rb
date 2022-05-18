require 'user'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
    end
    
    it 'creates a new user' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')

      connection = PG.connect(dbname: 'makers_bnb_test')
      persisted_data = persisted_data(table: :users, id: user.id )

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Teste Martin'
      expect(user.email).to eq 'test@example.com'
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

    it 'finds a user' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password:'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')

      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end

