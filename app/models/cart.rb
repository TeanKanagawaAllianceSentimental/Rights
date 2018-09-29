class Cart < ApplicationRecord

	belongs_to :member
  belongs_to :item

  def self.add_item(item_id, quantity, member_id, unit_price) # session_id,
    if member_id = current_member_id
      cart = Cart.find_or_initialize_by(item_id, member_id, session_id)
    end
    cart.quantity += 1
    if cart.item_error.present?
      return false
    else
      cart.save && cart(add_item_params)
    end
  end

  def update_quantity(quantity)
    self.quantity = quantity
    self.update
  end

  private

  def add_item_params
    params.require(:cart).permit(:session_id, :item_id, :quantity, :member_id, :unit_price)
  end

  def quantity_params
    params.require(:cart).permit(:quantity)
  end

end

