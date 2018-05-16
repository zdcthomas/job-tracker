require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'sick')
    visit new_job_path

    title = "Developer"
    description = "So fun!"
    level_of_interest = 80
    city = "Denver"

    fill_in "job[title]", with: title
    fill_in "job[description]", with: description
    fill_in "job[level_of_interest]", with: level_of_interest
    fill_in "job[city]", with: city
    select "#{category.title}", from: 'Category'
    select "#{company.name}", from: 'Company'
    
    click_on 'Save'

    job = Job.find_by(title: title)
    expect(current_path).to eq(job_path job)
    expect(page).to have_content(company.name)
    expect(page).to have_content(title)
    expect(page).to have_content(level_of_interest)
    expect(page).to have_content(city)
  end

  it 'should have a dropdown menu for categories' do
    visit new_job_path

    expect(page).to have_select('Category')
  end
  it 'should have a create new category button' do
    visit new_job_path

    expect(page).to have_link('Add A New Category')
  end
  context 'cancel button' do
    it 'should return the user to jobs path' do
      visit new_job_path

      click_on("Cancel")

      expect(current_path).to eq(jobs_path)
    end
  end
end
