require "rails_helper"
describe "A User" do
  describe "visits categories index" do
    it 'should contain all categories' do
      category1 = Category.create!(title:"Finance")
      category2 = Category.create!(title:"Entertainment Industry")
      category3 = Category.create!(title:"Entry Level")

      visit categories_path

      expect(page).to have_content(category1.title)
      expect(page).to have_content(category2.title)
      expect(page).to have_content(category3.title)
    end
    it 'should contain an edit button' do
      category1 = Category.create!(title:"Finance")

      visit categories_path

      expect(page).to have_button("Delete_#{category1.id}")
      expect(page).to have_button("Edit_#{category1.id}")
    end
  end
  describe 'clicks the edit button' do
    it 'should redirect to the corresponding edit page' do
      category1 = Category.create!(title:"Finance")

      visit categories_path
      click_on "Edit_#{category1.id}"

      expect(current_path).to eq(edit_category_path category1)
    end
  end
  describe 'clicks the delete button' do
    it 'should delete the corresponding category' do
      category1 = Category.create!(title:"Finance")
      category2 = Category.create!(title:"Entertainment Industry")

      visit categories_path
      click_on("Delete_#{category1.id}")

      expect(page).to have_content(category2.title)
      expect(page).to_not have_content(category1.title)
    end
  end
end
