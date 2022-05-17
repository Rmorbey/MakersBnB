feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')

    visit '/session/new'
  
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button 'Sign in'

    expect(page).to have_content 'Welcome, Teste'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: 'Teste Martin', email: 'test@example.com', password: 'password123')

    visit '/session/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, Teste'
    expect(page).to have_content 'Please check your email or password.'
  end
end
