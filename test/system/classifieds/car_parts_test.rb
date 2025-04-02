require "application_system_test_case"

class Classifieds::CarPartsTest < ApplicationSystemTestCase
  setup do
    @classifieds_car_part = classifieds_car_parts(:one)
  end

  test "visiting the index" do
    visit classifieds_car_parts_url
    assert_selector "h1", text: "Car parts"
  end

  test "should create car part" do
    visit classifieds_car_parts_url
    click_on "New car part"

    click_on "Create Car part"

    assert_text "Car part was successfully created"
    click_on "Back"
  end

  test "should update Car part" do
    visit classifieds_car_part_url(@classifieds_car_part)
    click_on "Edit this car part", match: :first

    click_on "Update Car part"

    assert_text "Car part was successfully updated"
    click_on "Back"
  end

  test "should destroy Car part" do
    visit classifieds_car_part_url(@classifieds_car_part)
    click_on "Destroy this car part", match: :first

    assert_text "Car part was successfully destroyed"
  end
end
