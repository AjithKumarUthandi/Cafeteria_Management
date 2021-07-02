class MenuItem < ApplicationRecord
  validates :item_name, presence: true
  validates :price, :active , presence: true
  validates_associated :menu_category

  belongs_to :menu_category

  def self.get_items(category_id)
    where("menu_category_id = ? and active ", category_id)
  end
end
