feature "Homepage" do
  scenario "can load homepage successfully" do
    visit("/")
    expect(page.status_code).to be(200)
  end

  scenario "can load 'MakersBnB' to homepage" do
    visit('/')
    expect(page).to have_content("MakersBnB")
  end
end
