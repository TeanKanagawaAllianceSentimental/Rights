class Address < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :member, optional: true
  belongs_to_active_hash :prefecture
  validates :corporate_name, presence: true
  validates :corporate_phonetic, format: {with: /^[ぁ-ん]+$/, multiline: true }
  validates :contact_person_name, presence: true
  validates :contact_person_phonetic, format: {with: /^[ぁ-ん]+$/, multiline: true }
  validates :phone, format: {with: /^(0{1}\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4})$/, multiline: true }
  validates :prefecture_id, presence: true
  validates :address1, presence: true
end
