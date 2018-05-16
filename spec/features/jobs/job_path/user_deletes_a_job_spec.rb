require 'rails_helper'

describe 'A user' do
  describe 'from the show page, clicks on the delete button' do
    it 'should delete' do
      category = Category.create!(title: 'Category')
      company = Company.create!(name: 'ESPN')
      job = company.jobs.create!(title: 'Developer',
                                  description: 'a greate gig',
                                  level_of_interest: 70,
                                  city: 'Denver',
                                  category_id: category.id)

      visit job_path(job)
      click_link 'Delete'

      expect(current_path).to eq(jobs_path)
      expect(page).to_not have_content(job.title)
    end
  end
end
