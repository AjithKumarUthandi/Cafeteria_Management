class Address < ApplicationRecord
  validates :door_no,:address,:city,:postal_code,:state,:country, presence: true
  validates_associated :users

  belongs_to :user
end
