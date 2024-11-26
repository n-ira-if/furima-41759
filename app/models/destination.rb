class Destination < ApplicationRecord
  attr_accessor :token
  belongs_to :purchase


  validates :post_code, presence: true
  validates :minicipalities, presence: true
  validates :street_address, presence: true
  validates :telephone_number, presence: true
  validates :purchase, presence: true
  validates :token, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  validates :region_id, presence: true, numericality: { other_than: 1 }
end
