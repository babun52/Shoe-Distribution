require('spec_helper')

describe(Store) do
  it { should have_and_belong_to_many(:brands) }
  it { should validate_presence_of(:name) }

  it('capitalize the name of the store') do
    test_store = Store.create(:name => 'epicodus')
    expect(test_store.name()).to(eq('Epicodus'))
  end
end
