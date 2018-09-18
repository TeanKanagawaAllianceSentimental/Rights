class Cart < ApplicationRecord

	belongs_to :member_id, dependent: :destroy

  def self.add_item(item_id, member_id, session_id)
    if session[:member_id] = member_id
      cart = Cart.find_or_initialize_by(item_id, member_id, session_id)
    else
      render # ログイン画面へ
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

  def update_sub_total
    self.sub_total = cart.item.subtotal * cart.item.quantity
  end

end

