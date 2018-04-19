module DeviseHelpers
  def sign_in(email, password)
    visit new_user_session_path

    click_button t("actions.devise.sign_in")

    fill_form(
      :user,
      email: email,
      password: password
    )

    click_button t("actions.devise.sign_in")
  end
end
