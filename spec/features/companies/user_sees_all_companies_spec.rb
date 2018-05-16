require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company = Company.create!(name: "ESPN")
    company_two = Company.create!(name: "Disney")

    visit companies_path

    expect(page).to have_content(company.name)
    expect(page).to have_content(company_two.name)
  end
  it 'should have a link to creating a new company at the top' do
    company = Company.create!(name: "ESPN")
    company_two = Company.create!(name: "Disney")

    visit companies_path

    expect(page).to have_link("Create A New Company")

    click_on("Create A New Company")

    expect(current_path).to eq(new_company_path)
  end
end
