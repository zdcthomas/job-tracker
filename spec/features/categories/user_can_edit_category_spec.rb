require "rails_helper"
describe "A User" do
  describe "visits edit category path" do
    it 'should have appropriate fields' do
      category1 = Category.create!(title:"Finance")

      visit edit_category_path category1

      expect(page).to have_field('category[title]')
    end
    it 'should update the category when submit is clicked' do
      category1 = Category.create!(title:"Finance")
      new_title = "Business"

      visit(edit_category_path category1)
      fill_in "category[title]", with: new_title
      click_on "Update Category"

      expect(current_path).to eq(category_path category1)
      expect(page).to have_content(new_title)
    end
  end
end
