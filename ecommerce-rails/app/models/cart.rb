class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_product(product)
    existing_item = cart_items.find_by(product_id: product.id)
    if existing_item
      existing_item.quantity += 1
      existing_item.save
    else
      cart_items.create(product: product, quantity: 1)
    end
  end
end
