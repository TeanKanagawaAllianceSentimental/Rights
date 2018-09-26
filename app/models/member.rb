class Member < ApplicationRecord
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :addresses
         has_many :sale_shippings
         has_many :sale_invoices
         has_many :credit_cards
         has_many :carts
         has_many :sales
         has_many :applicants, dependent: :destroy
         accepts_nested_attributes_for :addresses
	 def soft_delete
	 	update(deleted_at: Time.now)
	 end
	 def active_for_authentication?
	 	!deleted_at
	 end
	 def inactive_message
	 	!deleted_at ? super : :deleted_account
	 end
end
