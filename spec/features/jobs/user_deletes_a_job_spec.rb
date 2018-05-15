require 'rails_helper'

describe 'A user' do
  describe 'from the show page, clicks on the delete button' do
    it 'should delete' do
      category = Category.create!(title: 'Category')
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

      visit company_job_path(company, job)
      click_link 'Delete'


      expect(current_path).to eq(company_jobs_path company)
      expect(page).to_not have_content(job.title)
    end
  end
end
