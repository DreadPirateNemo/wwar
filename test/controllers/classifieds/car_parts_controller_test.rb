require "test_helper"

class Classifieds::CarPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classifieds_car_part = classifieds_car_parts(:one)
  end

  test "should get index" do
    get classifieds_car_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_classifieds_car_part_url
    assert_response :success
  end

  test "should create classifieds_car_part" do
    assert_difference("Classifieds::CarPart.count") do
      post classifieds_car_parts_url, params: { classifieds_car_part: {} }
    end

    assert_redirected_to classifieds_car_part_url(Classifieds::CarPart.last)
  end

  test "should show classifieds_car_part" do
    get classifieds_car_part_url(@classifieds_car_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_classifieds_car_part_url(@classifieds_car_part)
    assert_response :success
  end

  test "should update classifieds_car_part" do
    patch classifieds_car_part_url(@classifieds_car_part), params: { classifieds_car_part: {} }
    assert_redirected_to classifieds_car_part_url(@classifieds_car_part)
  end

  test "should destroy classifieds_car_part" do
    assert_difference("Classifieds::CarPart.count", -1) do
      delete classifieds_car_part_url(@classifieds_car_part)
    end

    assert_redirected_to classifieds_car_parts_url
  end
end
