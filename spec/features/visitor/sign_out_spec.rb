require "rails_helper"

RSpec.describe "Sign out", type: :feature do
  let(:user) { create :user, :confirmed }

  before do
    sign_in(user.email, "12345678")
  end

  it "Logged in user signs out" do
    click_link "Sign out"

    expect(page).to have_content("Signed out successfully")
    expect(page).to have_content("Sign in")
  end
end
