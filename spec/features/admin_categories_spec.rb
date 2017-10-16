require 'rails_helper'

RSpec.feature "Admin categories", type: :feature do
  before do
    Category.destroy_all
    Product.destroy_all
  end
  scenario 'admin creates new category' do
    new_cat_name = 'Awesomeness'
    visit admin_categories_path

    expect {
      click_link 'Add new category'
      fill_in 'Name', with: new_cat_name
      click_button 'Create Category'
    }.to change(Category, :count).by 1

    expect(page).to have_content 'Product Categories'
    expect(page).to have_content 'Created category'
  end

  scenario 'admin views category' do
    category = create :category
    product = create :product, category_id: category.id

    visit admin_category_path category

    expect(page).to have_content "Category #{category.id}: #{category.name}"
    expect(page).to have_content product.name
  end
end
