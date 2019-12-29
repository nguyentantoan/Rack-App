class Product < ActiveRecord::Base
  validates :product_id, presence: true
  validates :product_name, presence: true, length: {minimum: 5}
  validates :discontinued, presence: true
  validates :category_id, presence: true
  validates_with CategoryValidator
end
