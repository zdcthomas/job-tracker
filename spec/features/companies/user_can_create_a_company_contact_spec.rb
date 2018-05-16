require 'rails_helper'

describe 'a user' do
  let(:company) { Company.create!(name: 'ESPN') }

  describe 'visits a company show page' do
    it 'can create a contact' do
    visit company_path(company)

    full_name = 'Jon Doe'
    position = 'Farmer'
    email = 'jon@jondoe.com'

    fill_in 'contact[full_name]', with: full_name
    fill_in 'contact[position]', with: position
    fill_in 'contact[email]', with: email

    click_on 'Save'

    expect(current_path).to eq(company_path(company))

    expect(page).to have_content(full_name)
    expect(page).to have_content(position)
    expect(page).to have_content(email)
    expect(page).to have_button
    end
  end
end
