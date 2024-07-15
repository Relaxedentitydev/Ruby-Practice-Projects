class Product < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

  has_many :cart_items
  has_many :carts, through: :cart_items
end
