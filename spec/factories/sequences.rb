FactoryBot.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :album_title do |n|
    "Album #{n}"
  end
end
