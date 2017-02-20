require 'rails_helper'

describe "user visits home page" do
  scenario "user sees list of favorite gifs" do
    user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
    category = Category.create(title: "sports")
    gif1 = category.gifs.create(image_path:"http://media2.giphy.com/media/3o7TKsemaxgoibLiQE/giphy.gif")
    favorite = Favorite.create(user_id: user.id, gif_id: gif1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit "/users/#{User.last.id}"

  click_link "View Favorite Gifs"

  expect(page). to have_content("#{user.name} Favorites List")
  expect(page). to have_content("sports")
  expect(current_path).to eq ("/favorites")
  end
end
