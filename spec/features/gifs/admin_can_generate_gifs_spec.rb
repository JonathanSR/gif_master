require 'rails_helper'

describe "when admin visits categories page" do
  scenario "admin can generate a gif" do
    admin = User.create(name: "Admin", email:"email", password: "pass", role: 1 )
    category = Category.create(title: "sports")
    title = category.title
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

  visit categories_path

  click_on "Add GIF"
  fill_in 'search', with: title
  click_on "Generate Gif"

  expect(current_path). to eq(category_path(category))
  expect(page). to have_css("img[src*='giphy']")
  end
end

context "Regular user visits categories page" do
  scenario "user cannot create a new gif" do
    admin = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
    category = Category.create(title: "sports")
    title = category.title
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit categories_path
    click_on "Add GIF"

    expect(page). to have_content("404")
    
  end
end



