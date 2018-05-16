require 'rails_helper'

describe "a user visits /dashboard" do
  it 'should have a count of jobs by interest' do    
    category = Category.create!(title: 'Category')
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 80, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "another one", level_of_interest: 90, city: "Denver", category_id: category.id)

    
    visit dashboard

    expect(page).to have_content("90: 2")
    expect(page).to have_content("80: 1")
  end

  it 'should have the top three companies ranked by average level of interest' do
    category = Category.create!(title: 'Category')
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "not this either", level_of_interest: 10, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "not this", level_of_interest: 10, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "some job", level_of_interest: 80, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "another one", level_of_interest: 100, city: "Denver", category_id: category.id)

    visit dashboard

    within("top_companies") do
      within "li:nth-child(1)" do
        expect(page).to have_content("another one")
      end
      within "li:nth-child(2)" do
        expect(page).to have_content("Developer")
      end
      within "li:nth-child(3)" do
        expect(page).to have_content("some job")
      end
    end
  end
  it 'should have a count of jobs by location' do
    category = Category.create!(title: 'Category')
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "not this either", level_of_interest: 10, city: "Hong Kong", category_id: category.id)
    job = company.jobs.create!(title: "not this", level_of_interest: 10, city: "Hong Kong", category_id: category.id)
    job = company.jobs.create!(title: "some job", level_of_interest: 80, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Antarctica", category_id: category.id)
    job = company.jobs.create!(title: "another one", level_of_interest: 100, city: "Denver", category_id: category.id)

    visit dashboard

    expect(page).to have_content("Denver Jobs: 2")
    expect(page).to have_content("Hong Kong Jobs: 2")
    expect(page).to have_content("Antarctica Jobs: 1")

  end
  it 'should have a link to those locations' do
    category = Category.create!(title: 'Category')
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "not this either", level_of_interest: 10, city: "Hong Kong", category_id: category.id)
    job = company.jobs.create!(title: "not this", level_of_interest: 10, city: "Hong Kong", category_id: category.id)
    job = company.jobs.create!(title: "some job", level_of_interest: 80, city: "Denver", category_id: category.id)
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Antarctica", category_id: category.id)
    job = company.jobs.create!(title: "another one", level_of_interest: 100, city: "Denver", category_id: category.id)

    visit dashboard

    expect(page).to have_link("Denver Jobs")
    expect(page).to have_link("Hong Kong Jobs")
    expect(page).to have_link("Antarctica Jobs")
  end
  context 'location link' do
    it 'should redirect to the appropraite location page' do
      category = Category.create!(title: 'Category')
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "not this either", level_of_interest: 10, city: "Hong Kong", category_id: category.id)
      job = company.jobs.create!(title: "not this", level_of_interest: 10, city: "Hong Kong", category_id: category.id)
      job = company.jobs.create!(title: "some job", level_of_interest: 80, city: "Denver", category_id: category.id)
      job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Antarctica", category_id: category.id)
      job = company.jobs.create!(title: "another one", level_of_interest: 100, city: "Denver", category_id: category.id)
  
      visit dashboard
      click_on "Denver Jobs"

      expect(current_path).to eq(jobs_path location:"Denver")
    end
  end
end
