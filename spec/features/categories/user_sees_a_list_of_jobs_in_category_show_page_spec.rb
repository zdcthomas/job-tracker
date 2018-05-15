require 'rails_helper'

describe 'a user' do
  describe 'visits a page for a specific category' do
    it 'should also see a list of jobs in that category' do
      category = Category.create(title: 'BingBong')
      company = Company.create(name: 'Turing')
      job1 = category.jobs.create(title: 'Musician',
                                 description: 'plays stuff',
                                 level_of_interest: 100,
                                 city: 'Denvah',
                                 company_id: company.id)
      job2 = category.jobs.create(title: 'Longhair',
                                 description: 'dances stuff',
                                 level_of_interest: 75,
                                 city: 'Denvah',
                                 company_id: company.id)
      job3 = category.jobs.create(title: 'Devloper',
                                 description: 'makes stuff',
                                 level_of_interest: 50,
                                 city: 'Denvah',
                                 company_id: company.id)

      visit category_path(category)

      expect(page).to have_content(job1.title)
      expect(page).to have_content(job2.description)
      expect(page).to have_content(job3.city)
    end
  end
end
