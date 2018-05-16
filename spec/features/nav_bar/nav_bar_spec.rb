require 'rails_helper'

describe "The Nav Bar" do
  it 'should have links to jobs, companies, categories' do
 
    expect(partials:"nav").to have_link("Jobs")
  end
end