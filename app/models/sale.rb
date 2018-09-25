class Sale < ApplicationRecord
  belongs_to :member
  has_many :sale_items, dependent: :destroy

  # def total_price
  #   @total = Cart.where().each do |total|
  #   @total.sum
  # end
end

#   def total_price
#     sale = Sale.mamber.session_id
#   end


# def total_price
#     line_items.to_a.sum { |item| item.total_price }
# end
