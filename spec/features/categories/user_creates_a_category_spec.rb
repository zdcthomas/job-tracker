require 'rails_helper'

describe 'A User' do
  describe 'a user visits categories/new' do
    it 'should contain a form with the correct fields' do
      visit new_category_path

      expect(page).to have_content('New Category')
      expect(page).to have_field('category[title]')
      expect(page).to have_button('Create Category')
    end

    it 'should add the new category to the database' do
      visit new_category_path

      title = 'New Category'
      fill_in 'category[title]', with: title

      click_on 'Create'

      expect(Category.find(1).title).to eq(title)
    end

    it 'should redirect to category/show page' do
      visit new_category_path

      title = 'New Category'
      fill_in 'category[title]', with: title

      click_on 'Create'

      expect(current_path).to eq(category_path id: 1)
      expect(page).to have_content(title)
    end

    it 'redirects to the category creation page if the information is invalid' do
      visit new_category_path
      title = 'Some Title'
      Category.create(title: title)

      fill_in 'category[title]', with: title
      click_on 'Create'

      expect(current_path).to eq(new_category_path)
    end
  end
end
