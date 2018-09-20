class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_one :address
  # before_create :build_default_address

  # private
  # def build_default_address
  # 	build_address
  # 	true
  # end
end
