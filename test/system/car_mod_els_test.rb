require "application_system_test_case"

class CarModElsTest < ApplicationSystemTestCase
  setup do
    @model = models(:one)
  end

  test "visiting the index" do
    visit models_url
    assert_selector "h1", text: "Car models"
  end

  test "should create car model" do
    visit models_url
    click_on "New car model"

    fill_in "Model name", with: @model.name
    click_on "Create Car model"

    assert_text "Car model was successfully created"
    click_on "Back"
  end

  test "should update Car model" do
    visit model_url(@model)
    click_on "Edit this car model", match: :first

    fill_in "Model name", with: @model.name
    click_on "Update Car model"

    assert_text "Car model was successfully updated"
    click_on "Back"
  end

  test "should destroy Car model" do
    visit model_url(@model)
    click_on "Destroy this car model", match: :first

    assert_text "Car model was successfully destroyed"
  end
end
