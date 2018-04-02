require "rails_helper"

RSpec.describe "Sign up", type: :feature do
  let(:user) { User.first }
  let(:user_attributes) { attributes_for(:user).slice(:email, :password, :password_confirmation) }

  before do
    visit new_user_registration_path
    fill_form(:user, user_attributes)
    click_button "Sign up"
  end

  it "User signs up successfully" do
    open_email(user.email)

    expect(current_email).to have_subject "Confirmation instructions"
  end

  it "User confirms account" do
    open_email(user.email)
    visit_in_email "Confirm my account"

    expect(page).to have_text("Your email address has been successfully confirmed.")
  end

  it "User resents email confirmation instructions" do
    visit new_user_confirmation_path

    fill_in "user_email", with: user.email
    click_button "Resend confirmation instructions"

    open_email(user.email)

    expect(current_email).to have_subject "Confirmation instructions"
  end
end
