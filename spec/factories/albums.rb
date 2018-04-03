FactoryBot.define do
  factory :album, class: "Album" do
    title { generate(:album_title) }
    description { Faker::Lorem.sentence }
    parent_album { parent_album }
    user { user }
  end
end
