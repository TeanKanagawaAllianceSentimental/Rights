class Cart < ApplicationRecord

	belongs_to :member
  belongs_to :item

  def self.add_item(item_id, member_id, session_id)
    if session[:member_id] = current_member_id
      cart = Cart.find_or_initialize_by(item_id, member_id, session_id)
    else
      render new_member_session_path
    end
    cart.quantity += 1
    if cart.item_error.present?
      return false
    else
      cart.save && cart
    end
  end

  def update_quantity(quantity)
    self.quantity = quantity
    if self.item_error.present?
      return false
    else
      self.save
    end
  end

end

