require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makers_bnb_test')

      DatabaseConnection.setup('makers_bnb_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('makers_bnb_test')


      expect(connection).to receive(:exec_params).with("SELECT * FROM properties;", [])

      DatabaseConnection.query("SELECT * FROM properties;")
    end
  end
end
