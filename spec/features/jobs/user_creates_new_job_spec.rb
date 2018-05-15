require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'sick')
    visit new_company_job_path(company)

    title = "Developer"
    description = "So fun!"
    level_of_interest = 80
    city = "Denver"

    fill_in "job[title]", with: title
    fill_in "job[description]", with: description
    fill_in "job[level_of_interest]", with: level_of_interest
    fill_in "job[city]", with: city
    select category.title, from: 'Category'

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content(title)
    expect(page).to have_content(level_of_interest)
    expect(page).to have_content(city)
  end

  describe 'user creates a new job' do
    it 'should have a dropdown menu for categories' do
      company = Company.create!(name: "ESPN")
      visit new_company_job_path(company)

      expect(page).to have_select('Category')
    end
    it 'should have a create new category button' do
      company = Company.create!(name: "ESPN")
      visit new_company_job_path(company)

      expect(page).to have_link('add new category')
    end
  end
end
