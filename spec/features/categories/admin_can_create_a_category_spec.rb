require 'rails_helper'

describe "user visits categories/new" do
  scenario "if user is admin, admin creates a category" do
    admin = User.create(name: "Admin", email:"email", password: "pass", role: 1 )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit new_category_path

    fill_in 'category_title', with: "Sports"
    click_on "Create Category"

    expect(page).to have_content("Sports")
    expect(current_path).to eq(category_path(Category.last))
    expect(Category.count).to eq(1)
  end

  scenario "if user is not admin" do
    user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )

    visit new_category_path

    expect(page).to have_content("404")
  end    
end

