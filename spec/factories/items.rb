FactoryBot.define do
  factory :item do
    name { 'やま' }
    concept { 'これはやまです。' }
    price { 300 }
    category_id { 2 }
    situation_id { 2 }
    shippingfee_id { 2 }
    region_id { 2 }
    arrival_id { 2 }
    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/OIP.png'), filename: 'OIP.png', content_type: 'image/png')
    end

    association :user
  end
end
