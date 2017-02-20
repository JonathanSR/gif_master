require 'rails_helper'

describe "user visits gifs category page" do
  scenario "user marks gif as a favorite" do
  user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
  category = Category.create(title: "sports")
  gif1 = category.gifs.create(image_path:"http://media2.giphy.com/media/3o7TKsemaxgoibLiQE/giphy.gif")
  #gif2 = category.gifs.create(image_path:"http://media3.giphy.com/media/3otPos8rtgZade3lXW/giphy.gif")
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit category_path(category)

#save_and_open_page
  click_link "Favorite"
  expect(page). to have_content "Gif Added To Favorites"
  end
end

xdescribe "user visits gifs category page" do
  scenario "user can unfavor a gif" do
  user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
  category = Category.create(title: "sports")
  gif1 = category.gifs.create(image_path:"http://media2.giphy.com/media/3o7TKsemaxgoibLiQE/giphy.gif")
  favorite = Favorite.create(user_id: user.id, gif_id: gif1.id)
  byebug
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  

  visit category_path(category)
  #click_link "Favorite"

  click_link "Unfavorite"
  expect(page). to have_content "Gif Removed from Favorites"
  end
end




