require 'rails_helper'

describe "The Nav Bar" do
  it 'should have links to jobs, companies, categories' do
    skip
    expect(partials:"nav").to have_link("Jobs")
    expect(partials:"nav").to have_link("Companies")
    expect(partials:"nav").to have_link("Jobs")
  end
  context 'links' do
    skip
    it 'should redirect to jobs path' do
      skip
      render(partials:"nav")
      click_on "Jobs"
      expect(current_path).to eq(jobs_path)
    end
    it 'should redirect to companies path' do
      skip
      render(partials:"nav")
      click_on "Companies"
      expect(current_path).to eq(companies_path)
    end
    it 'should redirect to Categories path' do
      skip
      render(partials:"nav")
      click_on "Categories"
      expect(current_path).to eq(categories_path)
    end
  end
end