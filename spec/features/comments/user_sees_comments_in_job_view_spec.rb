require 'rails_helper'
describe "A User" do
  describe "visits a job show page" do
    it 'should contain a comment creation form' do

      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Tough Job")
      job = company.jobs.create!(title: "Developer",
                                 level_of_interest: 70,
                                 city: "Denver", 
                                 category_id: category.id)

      visit company_job_path(company, job)

      expect(page).to have_field("comment[content]")
      expect(page).to have_button("Create Comment")
    end

    it 'should display a comment on the job page after the comment is submitted' do

      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Tough Job")
      job = company.jobs.create!(title: "Developer",
                                 level_of_interest: 70,
                                 city: "Denver", 
                                 category_id: category.id)
      comment_content = "This is a great looking job. It even pays money!"


      visit company_job_path company, job
      fill_in "comment[content]", with: comment_content
      click_on "Create Comment"

      expect(current_path).to eq(company_job_path company, job)
      expect(page).to have_content(comment_content)
    end
    it 'should display all comments sbumitted' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Tough Job")
      job = company.jobs.create!(title: "Developer",
                                 level_of_interest: 70,
                                 city: "Denver", 
                                 category_id: category.id)
      comment_content1 = "This is a great looking job. It even pays money!"
      comment_content2 = "I've changed my mind, this job looks horrible."

      visit company_job_path company, job
      fill_in "comment[content]", with: comment_content1
      click_on "Create Comment"
      fill_in "comment[content]", with: comment_content2

      expect(page).to have_content(comment_content1)
      expect(page).to have_content(comment_content2)
    end
    it 'should display all comments sbumitted in reverse order of submission' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Tough Job")
      job = company.jobs.create!(title: "Developer",
                                 level_of_interest: 70,
                                 city: "Denver", 
                                 category_id: category.id)
      comment_content1 = "This is a great looking job. It even pays money!"
      comment_content2 = "I've changed my mind, this job looks horrible."

      visit company_job_path company, job
      fill_in "comment[content]", with: comment_content1
      click_on "Create Comment"
      fill_in "comment[content]", with: comment_content2
      click_on "Create Comment"

      expect(page).to have_content("li:nth-child(1)", :text => "#{comment_content2}")
      expect(page).to have_content("li:nth-child(2)", :text => "#{comment_content1}")
    end
  end
end
