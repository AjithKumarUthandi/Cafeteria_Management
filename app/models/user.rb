class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :phone_number, {presence: true, length: { is: 10 },numericality: true}

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

  def self.getUsersByRole(role)
    where("role = ? and archive_at is null",role)
  end
end
