require 'test_helper'

class LevelDoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @level_doctor = level_doctors(:one)
  end

  test "should get index" do
    get level_doctors_url
    assert_response :success
  end

  test "should get new" do
    get new_level_doctor_url
    assert_response :success
  end

  test "should create level_doctor" do
    assert_difference('LevelDoctor.count') do
      post level_doctors_url, params: { level_doctor: { description: @level_doctor.description, name: @level_doctor.name } }
    end

    assert_redirected_to level_doctor_url(LevelDoctor.last)
  end

  test "should show level_doctor" do
    get level_doctor_url(@level_doctor)
    assert_response :success
  end

  test "should get edit" do
    get edit_level_doctor_url(@level_doctor)
    assert_response :success
  end

  test "should update level_doctor" do
    patch level_doctor_url(@level_doctor), params: { level_doctor: { description: @level_doctor.description, name: @level_doctor.name } }
    assert_redirected_to level_doctor_url(@level_doctor)
  end

  test "should destroy level_doctor" do
    assert_difference('LevelDoctor.count', -1) do
      delete level_doctor_url(@level_doctor)
    end

    assert_redirected_to level_doctors_url
  end
end
