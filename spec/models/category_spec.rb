require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "should be invalid without a title" do
        category = Category.new

        expect(category).to be_invalid
      end
    end
    context "valid creation" do
      it 'should be valid with a title' do
        category = Category.new(title: "Some Title")

        expect(category).to be_valid
      end
    end
  end
end
