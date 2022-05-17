feature "list property" do
  scenario "can load add property page successfully" do
    visit("/")
    click_button "List your property"
    expect(page.status_code).to be(200)
  end

  scenario "user can list a property and see it displayed on listings" do
    visit("/")
    click_button "List your property"
    fill_in 'property_description', with: 'A great house'
    fill_in 'contact_details', with: 'A great person'
    click_button "Submit"
    expect(page).to have_content "A great person"
  end
end