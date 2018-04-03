require "rails_helper"

RSpec.describe "Create album", type: :feature do
  let(:user) { create :user, :confirmed }
  let(:album_attributes) {
    {
      title: "Root album title",
      description: "Root album description"
    }
  }

  before do
    sign_in(user.email, "12345678")

    visit new_album_path
  end

  it "I create new album with valid data" do
    expect {
      fill_form_and_submit(:album, album_attributes)
    }.to change(user.albums, :count).by(1)

    expect(page).to have_link album_attributes[:title]
  end

  it "I create new album with invalid data" do
    expect {
      fill_form_and_submit(:album, album_attributes.except(:title))
    }.not_to change(user.albums, :count)

    expect(page).to have_content "can't be blank"
  end
end
