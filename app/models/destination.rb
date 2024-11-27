class Destination < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  validates :region_id, presence: true, numericality: { other_than: 1 }
end
