class Sale < ApplicationRecord
  belongs_to :member_id
  has_many :sale_item_id, dependent: :destroy

end


# def total_price
#     line_items.to_a.sum { |item| item.total_price }
# end
