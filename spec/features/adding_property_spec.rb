feature 'Adding properties' do
  scenario 'user can add a view property' do
    visit('/sessions/new')
    click_button('Create an account')
    fill_in :name, with: 'Archie'
    fill_in :email, with: 'archie@makersbnb.com'
    fill_in :password, with: 'password'
    click_button 'Sign up now'

    click_button('List your property')
    fill_in :description, with: '2 bed house'
    fill_in :picture_url, with: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
    fill_in :price_per_night, with: '30'
    
    click_button('Submit')

    expect(page).to have_content '2 bed house'
    expect(page).to have_content '£30'
    expect(page).to have_css("img[src*='https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg']")
  end
end
