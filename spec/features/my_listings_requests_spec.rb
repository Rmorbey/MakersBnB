require_relative 'web_helpers'

feature 'view properties and requests' do
  scenario 'a user can view their properties' do
    user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
    Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: "https://imgur.com/uhj0V41", price_per_night: '30', user_id: user.id)
    
    visit('/')
    click_button 'Sign in'
    teste_sign_in
    

    click_button 'My listings'
    expect(current_path).to eq "/bookings/#{user.id}"
    expect(page).to have_content 'My listings:'
    expect(page).to have_content '2 bed home'
    

  end
  scenario ' a user can view the requests made on their property' do
  
  end

end