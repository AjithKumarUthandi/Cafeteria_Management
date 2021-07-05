class MenuCategory < ApplicationRecord
  validates :menu_name, {presence: true, uniqueness: true}

  has_many :menu_items

  def self.getactive_menuCategories
    where("active = ? and archive_at is null", true)
  end

  def self.get_menuCategories
    where("archive_at is null")
  end

end
