require 'rails_helper'

RSpec.feature "Admin products", type: :feature do
  before :all do
    Category.destroy_all
    @category = create :category
  end

  scenario 'admin creates new product' do
    new_prod_name = 'Bath towel'
    visit admin_products_path

    expect {
      click_link 'Add new product'
      fill_in 'Name', with: new_prod_name
      fill_in 'Price', with: '23.47'
      select @category.name, from: 'product_category_id'
      click_button 'Create Product'
    }.to change(Product, :count).by 1

    expect(page).to have_content 'Products'
    expect(page).to have_content 'Created product'
  end

  scenario 'admin views product' do
    product = create :product, category: @category

    visit admin_product_path product

    expect(page).to have_content product.id
    expect(page).to have_content product.name
    expect(page).to have_content product.price
    expect(page).to have_content product.category.name
  end
end
