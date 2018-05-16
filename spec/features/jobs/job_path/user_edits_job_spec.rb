require 'rails_helper'

describe 'user edits job' do
  describe 'they link from a show page from company job path' do
    describe 'they fill in a form' do
      it 'edits an existing entry' do
        category = Category.create!(title: 'Category')
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer",
                                   level_of_interest: 70,
                                   city: "Denver",
                                   category_id: category.id)

        visit job_path(job)

        click_on 'Edit'

        expect(current_path).to eq(edit_job_path(job))

        new_title = 'Not Developer'
        new_interest = 20
        new_city = 'Not Denver'

        fill_in 'job[title]', with: new_title
        fill_in 'job[level_of_interest]', with: new_interest
        fill_in 'job[city]', with: new_city

        click_on 'Save'

        expect(page).to have_content(new_title)
        expect(page).to have_content(new_interest)
        expect(page).to have_content(new_city)
      end

    end
  end
  context 'cancel button' do
    it 'should return the user to the jobs path' do
      category = Category.create!(title: 'Category')
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer",
                                level_of_interest: 70,
                                city: "Denver",
                                category_id: category.id)
      visit edit_job_path job

      click_on("Cancel")

      expect(current_path).to eq(jobs_path)
    end
  end

end
