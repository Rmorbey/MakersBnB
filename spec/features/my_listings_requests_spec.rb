require_relative 'web_helpers'

feature 'view properties and requests' do
  scenario 'a user can view their properties' do
    user = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
    property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: "https://imgur.com/uhj0V41", price_per_night: '30', user_id: user.id)
    
    visit('/')
    click_button 'Sign in'
    teste_sign_in
    

    click_button 'My listings'
    expect(current_path).to eq "/bookings/#{user.id}"
    expect(page).to have_text '2 bed home'
    expect(page).to have_text '£30'
    expect(page).to have_text "Property #{property.id}"
    
    

  end
  scenario ' a user can view the requests made on their property' do
    host = User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')
    guest = User.create(name: 'Timbo Thomas', email: 'timbo@example.com', password: 'password123')
    property = Property.add(description: '2 bed home', contact: host.email, picture_url: "https://imgur.com/uhj0V41", price_per_night: '30', user_id: host.id)
    booking = Booking.create(property_id: property.id, user_id: host.id, start_date: '01/01/2022', end_date: '08/01/2022')

    visit('/')
    teste_sign_in

    click_button 'My listings'
    expect(page).to have_text "Request for Property #{property.id}"    
  end

end