feature 'registration' do
  scenario 'a user can sign up' do
    visit('/sessions/new')
    click_button('Create an account')
    fill_in :name, with: 'Archie'
    fill_in :email, with: 'archie@makersbnb.com'
    fill_in :password, with: 'password'
    click_button 'Sign up now'

    expect(page).to have_content 'We make-a the bed'
  end
end
