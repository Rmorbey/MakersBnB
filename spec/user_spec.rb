require 'user'
require 'database_helpers'

describe User do

  describe '.create' do
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
end

