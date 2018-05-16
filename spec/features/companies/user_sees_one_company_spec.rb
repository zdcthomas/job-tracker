require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    skip
    category = Category.create!(title: 'Category')
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content(company.name)
    expect(page).to have_content(company.jobs.first.title)
  end
end
