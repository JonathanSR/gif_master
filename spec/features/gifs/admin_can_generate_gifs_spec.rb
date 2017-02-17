require 'rails_helper'

describe "when admin visits categories page" do
  scenario "admin can generate a gif" do
    admin = User.create(name: "Admin", email:"email", password: "pass", role: 1 )
    category = Category.create(title: "sports")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

  visit categories_path

  click_on "Add GIF"
  #select category.title, from: "Category"
  click_on "Create Gif"

  expect(current_path). to eq(category_path(categoy))
  expect(page). to have_css("img[src*='giphy']")
  end
end
