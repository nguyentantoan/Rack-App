class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :product_id, presence: true
  validates :product_name, presence: true, length: {minimum: 5}
  validates :discontinued, presence: true
  validates :category_id, presence: true
  validates_with CategoryValidator
end
