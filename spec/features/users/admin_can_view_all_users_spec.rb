require 'rails_helper'

describe "When an admin visits '/admin/users'" do
  describe "as an admin"
  it "they can see a list of users" do
    admin = User.create(name: "Admin", email:"email", password: "pass", role: 1 )
    User.create(name:"one", email:"email1", password: "pass", role: 0)
#byebug
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/users'
    #admin_users_path

    expect(page).to have_content("Admin")
    expect(page).to have_content("one")
  end
end


  describe "as a default user" do
    it "they see a 404" do
       user = User.create(name: "user1", email:"google", password: "pass", role: 0 )
    User.create(name:"admin", email:"yahoo", password: "pass", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/admin/users'
    #admin_users_path

    expect(page).to_not have_content("Admin")
    expect(page).to_not have_content("one")
    expect(page).to have_content("The page you were looking for doesn't exist")
    #expect page to raise 404 error
end
end