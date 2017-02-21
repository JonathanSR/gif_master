require 'rails_helper'

describe Category do
  describe "validations" do
    context "on a new category" do
      it "is invalid without a title" do
        category = Category.create()

        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "it is valid with a title" do
        category = Category.create(title:"reading")

        expect(category).to be_valid
      end
    end
  end
end