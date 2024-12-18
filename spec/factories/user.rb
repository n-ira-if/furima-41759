FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { '1aaaaaa' }
    password_confirmation { password }
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end