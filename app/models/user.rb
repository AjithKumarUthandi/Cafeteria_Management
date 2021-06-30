class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, {presence: true, uniqueness: true}
  validates :phone_number, {presence: true, length: { is: 10 },numericality: true}

  # PASSWORD_REQUIREMENTS =/\A
  #   (?=.{8,})
  #   (?=.*\d)
  #   (?=.*[a-z])
  #   (?=.*[A-Z])
  #   (?=.*[[:^alnum:]])
  # /x

  # validates :password, {length: {minimum:8, maximum:16}, format:PASSWORD_REQUIREMENTS, acceptance: { message: 'password must be conatain atleat one character from all symbol' } }

  has_many :addresses
  has_many :cart_items
  has_secure_password
end
