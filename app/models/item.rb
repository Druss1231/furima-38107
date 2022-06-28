class Item < ApplicationRecord
  validates :title,        presence: true, length: { maximum: 40 }
  validates :price,        numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :fee_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :description,  presence: true, length: { maximum: 1000 }
  validates :category_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :from_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :from
  belongs_to :ship
end
