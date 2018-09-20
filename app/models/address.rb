class Address < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :member, optional: true
  belongs_to_active_hash :prefecture
end
