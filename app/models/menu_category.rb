class MenuCategory < ApplicationRecord
  validates :menu_name, {presence: true, uniqueness: true}

  has_many :menu_items

  def self.get_menuCategories
    where("active = ?", true)
  end


end
