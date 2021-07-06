class MenuItem < ApplicationRecord
  validates :item_name, presence: true
  validates :menu_category_id, presence: true
  validates :price, numericality: { greater_than: 0 }
  belongs_to :menu_category

  def self.get_items(category_id)
    where("menu_category_id = ? and active and archive_at is null", category_id)
  end

  def self.getall_items(category_id)
    where("menu_category_id = ? and archive_at is null",category_id)
  end
end
