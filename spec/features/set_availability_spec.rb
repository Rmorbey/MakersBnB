feature "set availability" do
  scenario "A user can set the availability for their property" do
    visit('/properties/new')
    fill_in :description, with: '2 bed house'
    fill_in :contact, with: 'archie@makersbnb.com'
    fill_in :picture_url, with: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
    click_button('Submit')
    visit '/properties/1'

    fill_in :start_date, with: '01/01/2022'
    fill_in :end_date, with: '08/01/2022'
    expect(page).to have_content 'You have booked out your property from 01/01/2022 to 08/01/2022'
  end
end