require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post('/add_store') do
  name = params.fetch('store_name')
  new_store = Store.create(:name => name)
  @stores = Store.all()
  erb(:index)
end

get('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  erb(:store)
end

post('/add_brand') do
  name = params.fetch('brand_name')
  new_store = Brand.create(:name => name)
  @brands = Brand.all()
  erb(:store)
end
