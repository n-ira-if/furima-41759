class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :post_code, :minicipalities, :street_address, :telephone_number, :purchase, :user_id, :item_id, :region_id, :building_name

  with_options presence: true do
    validates :post_code
    validates :minicipalities
    validates :street_address
    validates :telephone_number
    validates :token
    validates :user_id
    validates :item_id
    validates :region_id, numericality: { other_than: 1 }
  end

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      purchase = Purchase.create(item_id: item_id, user_id: user_id, token: token)
      Destination.create(purchase_id: purchase.id, post_code: post_code, minicipalities: minicipalities, street_address: street_address, telephone_number: telephone_number, region_id: region_id, building_name: building_name)
    end
  end
end



