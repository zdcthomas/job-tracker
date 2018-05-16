require 'rails_helper'

describe 'a user' do
  let(:company) { Company.create!(name: 'ESPN') }

  describe 'visits company show page' do
    it 'should see a form to enter contact info' do
      visit company_path(company)

      within '.contact-form' do
        expect(page).to have_css('form')

      expect(page).to have_field('contact[full_name]')
      expect(page).to have_field('contact[position]')
      expect(page).to have_field('contact[email]')
      expect(page).to have_button('Edit')
      expect(page).to have_button('Delete')
      end
    end
  end
end
