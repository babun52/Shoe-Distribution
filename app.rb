require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb(:index)
end

post('/stores') do
  name = params.fetch('store_name')
  new_store = Store.create(:name => name)
  @stores = Store.all()
  redirect to ('/')
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @stores = Store.all()
  @brands = Brand.all()
  erb(:store)
end

patch('/stores/:id') do
  rename = params.fetch('rename')
  @store = Store.find(params.fetch('id').to_i())
  if @store.update({:name => rename})
    @brands = Brand.all()
    redirect to ("/stores/#{@store.id()}")
  else
    redirect to ("/stores/#{@store.id()}")
  end
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.destroy()
  redirect to ('/')
end

post('/brands') do
  name = params.fetch('brand_name')
  @stores = Store.find(params.fetch('stores').to_i())
  @new_brand = Brand.create(:name => name)
  redirect to ('/')
end
