feature 'Adding properties' do
  scenario 'user can add a view property' do
    visit '/properties/new'
    fill_in :description, with: '2 bed house'
    fill_in :contact, with: 'archie@makersbnb.com'
    click_button 'Submit'

    expect(page).to have_content '2 bed house'
    expect(page).to have_content 'archie@makers.com'
  end
end
