require 'rails_helper'

describe "when user visits categories page" do
  describe "user sees all categories" do
    scenario "user selects a category to view gifs" do
    user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
   # byebug
    category = Category.create(title: "sports")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gif1 = category.gifs.create()
    gif2 = category.gifs.create()


     visit user_path(user)

    click_on "view gif categories"

    expect(page).to have_content("sports")
    expect(current_path).to eq(categories_path)
    end
  end


  xdescribe "user sees all gifs" do
  scenario "user sees all gifs for that category" do
  user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
  category = Category.create(title: "sports")
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
    visit categories_path
#save_and_open_page
    click_link "/categories/#{category.id}"

    expect(page). to have_css("img[scr*='giphy']")
  end
end
end
