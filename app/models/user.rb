class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, {presence: true, uniqueness: true}
  validates :phone_number, {presence: true, length: { is: 10 }}
  validates :role, {presence: true, acceptance: { accept: ['customer', 'owner'] }}

  has_many :addresses
end
