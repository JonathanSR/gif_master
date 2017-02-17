require 'rails_helper'

describe User do
    describe "validations" do
      context "on a new user" do
        it "is invalid without a name" do
          user = User.create(email:"123@123.123", password:"123")

          expect(user).to be_invalid
        end

        it "is invalid without a password" do
          user = User.create(name: "User1", email:"123@123.123")

          expect(user).to be_invalid
        end

        it "is invalid without an email" do
          user = User.create(name: "User1", password:"123")

          expect(user).to be_invalid
        end

        it "has a unique email" do
          User.create(email:"123@123.123", password:"123")
          user = User.create(email:"123@123.123", password:"123")

          expect(user).to be_invalid
        end
      end

      context "valid attributes" do
        it "is valid with a name, email and password" do
          user = User.create(name:"User1", email:"123@123.123", password:"123")

          expect(user).to be_valid
        end
      end
  end
end
                           