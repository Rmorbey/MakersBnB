feature "Homepage" do
  scenario "can load homepage successfully" do
    visit("/")
    expect(page.status_code).to be(200)
  end
end
