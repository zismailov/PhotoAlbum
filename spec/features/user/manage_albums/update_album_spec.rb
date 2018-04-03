require "rails_helper"

RSpec.describe "Update album", type: :feature do
  include_context "when user with album"

  let(:valid_attributes) {
    {
      title: "New album title",
      description: "New album description"
    }
  }

  let(:invalid_attributes) {
    {
      title: "",
      description: "New album description"
    }
  }

  before do
    sign_in(user.email, "12345678")

    visit edit_album_path(root_album)
  end

  it "I update album with valid data" do
    fill_form_and_submit(:album, :edit, valid_attributes)

    expect(page).to have_content valid_attributes[:title]
  end

  it "I update album with invalid data" do
    fill_form_and_submit(:album, :edit, invalid_attributes)

    expect(page).to have_content "can't be blank"
  end
end
