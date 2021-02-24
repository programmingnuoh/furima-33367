FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password
    password {password}
    password_confirmation {password}
    last_name {person.last.kanji}
    first_name {person.first.kanji}
    last_name_kana {person.last.katakana}
    first_name_kana {person.first.katakana}
    birth_date {Faker::Date.birthday(min_age: 20, max_age: 90)}
  end
end