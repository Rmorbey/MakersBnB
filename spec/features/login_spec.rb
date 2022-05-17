feature 'Login' do
  scenario 'login with username' do
    visit '/properties'
    click_button('login')
    
    expect(current_path).to eq "/login"

    fill_in :username, with: 'ArchieParchie'
    click_button('Login')
    
    expect(current_path).to eq "/Properties"
    expect(page).to have_content("ArchieParchie")
  end
end

    
