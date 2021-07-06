class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :phone_number, {presence: true, length: { is: 10 },numericality: true}

  # PASSWORD_REQUIREMENTS =/\A
  #   (?=.{8,})
  # /x

  # validates :password, {length: {minimum:8, maximum:16}, format:PASSWORD_REQUIREMENTS, acceptance: { message: 'password must be conatain atleat one character from all symbol' } }, on: :create

  has_many :addresses
  has_many :cart_items
  has_many :orders
  has_secure_password

  def self.valid_email(email)
    if(email.present?)
      users = User.where("lower(email)=?",email.downcase)
      users.each do |user|
        unless user.archive_at
          return false
        end
      end
    end
    return true;
  end
end
