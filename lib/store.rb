class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true})
  before_save(:capitalize_store_name)

private

  define_method(:capitalize_store_name) do
    self.name = (name().titlecase())
  end
end
