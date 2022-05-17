feature 'Adding properties' do
  scenario 'user can add a view property' do
    visit('/properties/new')
    fill_in :description, with: '2 bed house'
    fill_in :contact, with: 'archie@makersbnb.com'
    fill_in :picture_url, with: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'
    click_button('Submit')

    expect(page).to have_content '2 bed house'
    expect(page).to have_content 'archie@makersbnb.com'
    expect(page).to have_link(nil, href: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg')
  end

  feature 'Property added is specific to certain user' do
    scenario 'Property lists under a specific user' do
      url = 'https://a0.muscache.com/im/pictures/1f6c495e-b877-4a48-9f2c-d8012f640166.jpg?im_w=1200'
      property = Property.add(description: '2 bed home', contact: 'archie@makersbnb.com', picture_url: url)

      visit '/properties'

      click_button('login')
      
      expect(current_path).to eq "/login"

      fill_in :username, with: 'ArchieParchie'

      expect(current_path).to eq "/properties"

      click_button('List your property')

      expect(current_path).to eq "/properties/new"

      #fill_in :user, with: 'ArchieParchie'
      fill_in :description, with: '2 bed house'
      fill_in :contact, with: 'archie@makersbnb.com'
      fill_in :picture_url, with: 'https://www.homestratosphere.com/wp-content/uploads/2020/07/pretty-houses-july092020.jpg'

      click_button('Submit')

      expect(current_path).to eq "/properties"

      click_button('List your property')

      expect(current_path).to eq "/properties/new"

      #fill_in :user, with: 'ArchieParchie'
      fill_in :description, with: '4 bed flat'
      fill_in :contact, with: 'archie@makersbnb.com'
      fill_in :picture_url, with: 'https://a0.muscache.com/im/pictures/prohost-api/Hosting-48509375/original/0862735b-4abc-4d87-a8d1-f2fb6053adc8.jpeg?im_w=1200'
      
      click_button('Submit')

      expect(current_path).to eq "/properties"
      expect(page).to have_content 'ArchieParchie'
    end
  end
end
