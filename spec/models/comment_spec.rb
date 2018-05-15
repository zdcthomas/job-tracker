require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      xit "is invalid without content" do
        comment = Comment.new
        expect(comment).to be_invalid
      end
    end
    context "valid attributes" do
      it 'should be valid with content' do 
        comment = Comment.new(content: "this is some content for a great comment")
        expect(comment).to be_valid
      end
    end
  end
end
