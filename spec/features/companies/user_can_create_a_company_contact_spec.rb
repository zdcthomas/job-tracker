require 'rails_helper'

describe 'a user' do
  let(:company) { Company.create!(name: 'ESPN') }

  describe 'visits a company show page' do
    it 'can create a contact' do
    visit company_path(company)

    end
  end
end
