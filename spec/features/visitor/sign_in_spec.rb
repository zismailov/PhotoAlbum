require "rails_helper"

RSpec.describe "Sign in", type: :feature do
  let(:user)               { create :user, :confirmed }
  let(:not_confirmed_user) { create :user, :not_confirmed }

  it "User signs in successfully" do
    sign_in(user.email, "12345678")

    expect(page).to have_link("Sign out")
  end

  it "User signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_link("Sign in")
  end

  it "User has not confirmed email address" do
    sign_in(not_confirmed_user.email, "12345678")

    expect(page).to have_content("You have to confirm your email address before continuing.")
  end

  it "User forgets his password" do
    visit new_user_password_path

    fill_in "user_email", with: user.email
    click_button "Send me reset password instructions"

    open_email(user.email)

    expect(current_email).to have_subject "Reset password instructions"
  end
end
