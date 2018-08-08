require "rails_helper"

RSpec.describe "Cancel account", type: :feature do
  let(:user) { create :user, :confirmed }

  before do
    sign_in(user.email, "12345678")
  end

  it "I cancel my account" do
    visit edit_user_registration_path(user)

    click_button "I want to delete my account!"

    expect(page).to have_content("Sign in")

    visit new_user_session_path
    sign_in(user.email, "12345678")

    expect(page).to have_content("Invalid Email or password.")
  end
end
