feature "list property" do
  scenario "can load add property page successfully" do
    visit("/")
    click_button "List your property"
    expect(page.status_code).to be(200)
  end
end