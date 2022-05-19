feature 'Adding properties' do
  scenario 'user can add a view property' do
    visit('/properties/new')
    fill_in :description, with: '2 bed house'
    fill_in :contact, with: 'archie@makersbnb.com'
    fill_in :price_per_night, with: '£30'
    fill_in :picture_url, with: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
    
    click_button('Submit')

    expect(page).to have_content '2 bed house'
    expect(page).to have_content 'archie@makersbnb.com'
    expect(page).to have_content '£30'
    expect(page).to have_css("img[src*='https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg']")
  end
end
