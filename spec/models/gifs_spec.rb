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
end
