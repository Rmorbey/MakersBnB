feature "set availability" do
  scenario "A user can set the availability for their property" do
    visit('/properties/new')
    fill_in :description, with: '2 bed house'
    fill_in :price_per_night, with: '30'
    fill_in :picture_url, with: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
    click_button('Submit')
    visit '/properties/:id'

    fill_in :start_date, with: '01/01/2022'
    fill_in :end_date, with: '08/01/2022'
    click_button('Submit')
    expect(page).to have_content "Property successfully booked!!!!!!!!!!!!!! :D:D:D:D:D"
  end
end