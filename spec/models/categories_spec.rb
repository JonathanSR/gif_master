require 'rails_helper'

describe Category do
  describe "validations" do
    context "on a new category" do
      it "is invalid with a title" do
        category = Category.create()

        expect(category).to be_invalid
      end

      it "has a unique email" do
        Category.create(title:"code")
        category = Category.create(title:"code")
      end
    end

    context "valid attributes" do
      it "it is valid with a title" do
        category = Category.create(title:"reading")
      end
    end
  end
end