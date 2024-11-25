class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shippingfee
  belongs_to :region
  belongs_to :arrival

  
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :situation_id, presence: true, numericality: { other_than: 1 }
  validates :shippingfee_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :arrival_id, presence: true, numericality: { other_than: 1 }
end
