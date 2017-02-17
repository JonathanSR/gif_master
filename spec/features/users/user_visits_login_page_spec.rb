require 'rails_helper'

describe "user visits login page" do
  scenario "user can create account" do
  name = "User1"
  email = "abc"
  password = "123"
  #repass = "123"

    visit sign_up_path

    fill_in "user_name", with: name
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password
    click_on "Create User"
# byebug
    expect(page).to have_content("Welcome")
    expect(current_path).to eq("/users/#{User.last.id}")
    expect(User.count).to eq(1)
  end
end
