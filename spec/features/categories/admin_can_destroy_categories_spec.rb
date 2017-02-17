require 'rails_helper'

describe "admin can delete a category" do
  scenario 'admin visits a category show page' do
    admin = User.create(name: "Admin", email:"email", password: "pass", role: 1 )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = Category.create(title:"Nikki Minaj")

    visit category_path(category)

    click_on "Delete Category"

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_link(category.title, href:category_path(category))
  end
end

describe "user cannot delete a category" do
  scenario "user visits a category show page" do
    user = User.create(name: "Admin", email:"email", password: "pass", role: 0 )
    category = Category.create(title:"Nikki Minaj")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
     
    visit category_path(category)

    click_on "Delete Category"
    
    expect(page).to have_content("404")
  end
end