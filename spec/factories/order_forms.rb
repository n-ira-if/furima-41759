FactoryBot.define do
  factory :order_form do
    post_code           { '123-4567' }
    region_id           { 2 }
    minicipalities      { '市区町村' }
    street_address      { '番地' }
    building_name       { '建物名' }
    telephone_number    { '00000000000' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
