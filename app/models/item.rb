class Item < ApplicationRecord
  validates :title,       presence: true 
  validates :price,       presence: true 
  validates :fee,         presence: true 
  validates :description, presence: true 
  validates :category,    presence: true 
  validates :condition,   presence: true 
  validates :from,        presence: true 
  validates :ship_date,   presence: true 

  has_one_attached :image
end
