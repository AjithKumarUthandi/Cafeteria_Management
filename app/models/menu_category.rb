class MenuCategory < ApplicationRecord
  validates :menu_name, presence: true
  validate :valid_menu_name

  has_many :menu_items
  def valid_menu_name
    if(menu_name.present?)
      categories = MenuCategory.where("lower(menu_name)=?",menu_name.downcase)
      categories.each do |category|
        unless category.archive_at
          errors.add(menu_name, "aldready_exist")
          break
        end
      end
    end
  end

  def self.getactive_menuCategories
    where("active = ? and archive_at is null", true).order(id: :desc)
  end

  def self.get_menuCategories
    where("archive_at is null")
  end

end
