require 'rails_helper'

describe Gif do
  describe "validations" do
    it "is invalid without an image_path" do
      gif = Gif.create()

      expect(gif).to be_invalid
    end
  end
  
  context "valid attributes" do
    it "is valid with an image_path" do
      category = Category.create(title:"sports")
      gif = category.gifs.create(image_path:"www.google.com")

      expect(gif).to be_valid
    end
  end

  context "valid associations to category" do
    it {should belong_to (:category) }
  end

  context "valid associations to favorites" do
    it {should have_many (:favorites)} 
  end

  context "valid associations to user" do
    it {should have_many (:users)}
  end
  
end
