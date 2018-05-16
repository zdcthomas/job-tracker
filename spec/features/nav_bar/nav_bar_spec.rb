require 'rails_helper'

describe "The Nav Bar" do
  it 'should have links to jobs, companies, categories' do

    expect(partial:"nav").to have_link("Jobs")
    expect(partial:"nav").to have_link("Companies")
    expect(partial:"nav").to have_link("Categories")
  end
end