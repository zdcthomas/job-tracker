require 'rails_helper'

describe "User creates a new company" do
  scenario "a user can create a new company" do
    visit new_company_path

    name = "ESPN"
    fill_in "company[name]", with: name
    click_button "Create"

    company = Company.find_by(name: "ESPN")

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(name)
    expect(Company.count).to eq(1)
  end
end
