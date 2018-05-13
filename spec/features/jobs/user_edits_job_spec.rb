require 'rails_helper'

describe 'user edits job' do
  describe 'they link from a show page' do
    describe 'they fill in a form' do
      it 'edits an existing entry' do
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

        visit company_job_path(company, job)

        click_on 'Edit'

        expect(current_path).to eq(edit_company_job_path(company, job))

        fill_in 'job[title]', with: 'Not Developer'
        fill_in 'job[level_of_interest]', with: 20
        fill_in 'job[city]', with: 'Not Denver'

        click_on 'Update Job'

        new_title = 'Not Developer'
        new_interest = 20
        new_city = 'Not Denver'

        expect(page).to have_content(new_title)
        expect(page).to have_content(new_interest)
        expect(page).to have_content(new_city)
      end
    end
  end
end
