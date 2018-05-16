require 'rails_helper'

describe "User sees all jobs job path" do
  scenario "a user sees all the jobs for a specific company" do
    category = Category.create!(title: 'Category')
    company = Company.create!(name: "ESPN")
    job1=company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2=company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit jobs_path

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.level_of_interest)
    expect(page).to have_content(job1.city)
    
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.level_of_interest)
    expect(page).to have_content(job2.city)
  end
end
