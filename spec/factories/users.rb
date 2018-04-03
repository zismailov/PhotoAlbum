FactoryBot.define do
  factory :user do
    email
    password "12345678"
    password_confirmation "12345678"
  end

  trait :confirmed do
    confirmed_at { 1.hour.ago }
  end

  trait :not_confirmed do
    confirmed_at nil

    after(:create) do |user|
      user.update(confirmation_sent_at: 1.day.ago)
    end
  end
end
