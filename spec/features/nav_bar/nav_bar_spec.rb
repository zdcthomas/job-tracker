require 'rails_helper'

describe "The Nav Bar" do
  it 'should have links to jobs, companies, categories' do

    visit jobs_path

    within ('.nav_bar') do
      expect(page).to have_link('Jobs')
      expect(page).to have_link('Companies')
      expect(page).to have_link('Categories')
    end
  end
  context 'links' do
    it 'should redirect to jobs path' do
      visit companies_path

      click_on "Jobs"

      expect(current_path).to eq(jobs_path)
    end
    it 'should redirect to companies path' do
      visit jobs_path

      click_on "Companies"

      expect(current_path).to eq(companies_path)
    end
    it 'should redirect to Categories path' do
      visit jobs_path
      
      click_on "Categories"

      expect(current_path).to eq(categories_path)
    end
  end
end
