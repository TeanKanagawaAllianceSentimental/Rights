class Address < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :member, optional: true
  belongs_to_active_hash :prefecture
  validates :corporate_name, presence: true
  validates :corporate_phonetic, format: {with: /^[ぁ-ん]+$/, multiline: true }
  validates :contact_person_name, presence: true
  validates :contact_person_phonetic, format: {with: /^[ぁ-ん]+$/, multiline: true }
  validates :phone, format: {with: /^(0{1}\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4})$/, multiline: true }
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :address1, presence: true
  def self.search(search)
    if search
    Address.where('corporate_name LIKE ? or contact_person_name LIKE ?', "%#{search}%", "%#{search}%")
    else
    Address.all
    end
  end
end
