class Address < ApplicationRecord
  validates :door_no,:address,:city,:postal_code,:state,:country, presence: true
  belongs_to :user

  def self.isUserHasAddress(user_id)
    where("user_id=?",user_id).count
  end
end
