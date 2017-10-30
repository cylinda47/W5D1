FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    # password_digest "MyString"
    # session_token "MyString"
  end
end
