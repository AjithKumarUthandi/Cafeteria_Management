class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, {presence: true, uniqueness: true}
  validates :phone_number, {presence: true, length: { is: 10 },numericality: true}

  has_many :addresses
  has_secure_password
end
