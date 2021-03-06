require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Artist", with: @product.artist_id
    fill_in "Genre", with: @product.genre_id
    check "Is deleted" if @product.deleted_at
    fill_in "Label", with: @product.label_id
    fill_in "Photo", with: @product.photo_id
    fill_in "Product name", with: @product.product_name
    fill_in "Product price", with: @product.product_price
    fill_in "Sales status", with: @product.sales_status
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @product.artist_id
    fill_in "Genre", with: @product.genre_id
    check "Is deleted" if @product.deleted_at
    fill_in "Label", with: @product.label_id
    fill_in "Photo", with: @product.photo_id
    fill_in "Product name", with: @product.product_name
    fill_in "Product price", with: @product.product_price
    fill_in "Sales status", with: @product.sales_status
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
