require "rails_helper"

RSpec.describe "Update account with valid data", type: :feature do
  let(:user) { create :user, :confirmed }

  before do
    sign_in(user.email, "12345678")
    visit edit_user_registration_path(user)
  end

  it "I submit update account form with valid data" do
    fill_form(
      :user,
      :edit,
      email: "mail@example.com",
      current_password: "12345678"
    )
    click_button "Update"

    expect(page).to have_content("You updated your account successfully")
  end

  it "Wrong current password" do
    fill_form(
      :user,
      :edit,
      email: "mail@example.com",
      current_password: "wrong"
    )
    click_button "Update"

    expect(page).to have_content("is invalid")
  end
end
