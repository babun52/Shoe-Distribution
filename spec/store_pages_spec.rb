require('spec_helper')

describe("adding a store", {:type => :feature}) do
  it('adds a new store') do
    visit('/')
    fill_in("store_name", :with => "macy")
    click_on("Add Store")
    expect(page).to have_content("Macy")
  end
end

describe('editing a store name', {:type => :feature}) do
  it('renames the store') do
    visit('/')
    fill_in("store_name", :with => "macy")
    click_on("Add Store")
    click_link("Macy")
    fill_in("rename", :with => "nordstrom")
    click_on("Rename")
    expect(page).to have_content("Nordstrom")
  end
end

describe('deleting a store name', {:type => :feature}) do
  it('deletes the store') do
    visit('/')
    fill_in("store_name", :with => "macy")
    click_on("Add Store")
    click_link("Macy")
    click_on("DELETE")
    expect(page).to have_content("There aren't any stores yet!")
  end
end

describe('adding shoe brands to a store name', {:type => :feature}) do
  it('adds existing shoe brands to a store') do
    store = Store.create(:name => 'macy')
    brand = Brand.create(:name => 'nike')
    visit("/stores/#{store.id()}")
    check('Nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end
