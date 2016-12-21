require('spec_helper')

describe("adding a store", {:type => :feature}) do
  it('adds a new store') do
    visit('/')
    fill_in("store_name", :with => "macy")
    click_on("Add Store")
    expect(page).to have_content("Macy")
  end
end
