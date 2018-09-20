class Cart < ApplicationRecord

	belongs_to :member_id, dependent: :destroy

  def self.add_item(item_id, member_id, session_id)
    if session[:member_id] = current_smember_id
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

end

# ec tripからの丸パクリ
 # belongs_to :member
 #  belongs_to :item

 #  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, presence: true

 #  def self.add_item(item_id, member, cart_session_id)
 #    if member.present?
 #      cart = Cart.find_or_initialize_by(member: member, item_id: item_id)
 #    else
 #      cart = Cart.find_or_initialize_by(session_id: cart_session_id, item_id: item_id)
 #    end
 #    cart.quantity += 1
 #    if cart.item_error.present?
 #      return false
 #    else
 #      cart.save! && cart
 #    end
 #  end

 #  def update_quantity(quantity)
 #    self.quantity = quantity
 #    if self.item_error.present?
 #      false
 #    else
 #      self.save!
 #    end
 #  end
