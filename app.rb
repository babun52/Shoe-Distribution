require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post('/stores') do
  name = params.fetch('store_name')
  new_store = Store.create(:name => name)
  @stores = Store.all()
  erb(:index)
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @brands = Brand.all()
  erb(:store)
end

patch('/stores/:id') do
  rename = params.fetch('rename')
  @store = Store.find(params.fetch('id').to_i)
  if @store.update({:name => rename})
    @brands = Brand.all()
    redirect to ("/stores/#{@store.id()}")
  else
    redirect to ("/stores/#{@store.id()}")
  end
end

post('/brands') do
  name = params.fetch('brand_name')
  new_brand = Brand.create(:name => name)
  @brands = Brand.all()
  erb(:store)
end
