feature "Homepage" do
  scenario "can load homepage successfully" do
    visit("/")
    expect(page.status_code).to be(200)
  end

  scenario "authenticated users arrive at the properties page" do
    visit('/sessions/new')
    click_button('Create an account')
    fill_in :name, with: 'Archie'
    fill_in :email, with: 'archie@makersbnb.com'
    fill_in :password, with: 'password'
    click_button 'Sign up now'
    
    expect(current_path).to eq("/properties")
  end
end
