require "application_system_test_case"

class CarBrandsTest < ApplicationSystemTestCase
  setup do
    @brand = brands(:one)
  end

  test "visiting the index" do
    visit brands_url
    assert_selector "h1", text: "Car brands"
  end

  test "should create car brand" do
    visit brands_url
    click_on "New car brand"

    fill_in "Brand name", with: @brand.brand_name
    click_on "Create Car brand"

    assert_text "Car brand was successfully created"
    click_on "Back"
  end

  test "should update Car brand" do
    visit brand_url(@brand)
    click_on "Edit this car brand", match: :first

    fill_in "Brand name", with: @brand.brand_name
    click_on "Update Car brand"

    assert_text "Car brand was successfully updated"
    click_on "Back"
  end

  test "should destroy Car brand" do
    visit brand_url(@brand)
    click_on "Destroy this car brand", match: :first

    assert_text "Car brand was successfully destroyed"
  end
end
