require "rails_helper"

RSpec.describe "Browse albums", type: :feature do
  include_context "when user with album"

  let!(:other_user) { create :user, :confirmed }
  let!(:other_user_root_album) { create :album, user: other_user, parent_album: nil }

  before do
    sign_in(user.email, "12345678")

    visit albums_path
  end

  it "I browse my root level albums" do
    expect(page).to have_content user_root_album.title
  end

  it "I can't see not my root level albums" do
    expect(page).not_to have_content other_user_root_album.title
  end

  it "I browse albums nested to root level album" do
    click_link user_root_album.title

    expect(page).to have_content user_child_album.title
  end
end
