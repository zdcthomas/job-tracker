require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        category = Category.create!(title: 'Category')
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", 
                                  level_of_interest: 70, 
                                  city: "Denver", 
                                  category_id: category.id     )
        comment = Comment.new(job_id: job.id)
        expect(comment).to be_invalid
      end
    end
    context "valid attributes" do
      it 'should be valid with content' do
        category = Category.create!(title: 'Category')
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", 
                                  level_of_interest: 70, 
                                  city: "Denver", 
                                  category_id: category.id     )
        comment = Comment.new(content: "this is some content for a great comment", job_id: job.id)
        expect(comment).to be_valid
      end
    end
  end
end
