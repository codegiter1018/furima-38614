FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    sei_kanji              { '田中' }
    mei_kanji              { '太郎' }
    sei_katakana           { 'タナカ' }
    mei_katakana           { 'タロウ' }
    birthday               { Faker::Date.birthday }
  end
end
