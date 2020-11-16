FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    pw_pattern = '1a' + Faker::Internet.password(min_length: 6)
    password { pw_pattern }
    password_confirmation { pw_pattern }
    family_name { Gimei.last.kanji }
    given_name { Gimei.first.kanji }
    family_name_kana { Gimei.last.katakana }
    given_name_kana { Gimei.first.katakana }
    birth_date { Faker::Date.between(from: '1930-01-01', to: 5.year.ago) }
  end
end
