require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_url
    assert_response :success
  end

  test "should get new" do
    get new_doctor_url
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post doctors_url, params: { doctor: { admission_date: @doctor.admission_date, clinic_id: @doctor.clinic_id, estate_id: @doctor.estate_id, last_name: @doctor.last_name, level_doctor_id: @doctor.level_doctor_id, name: @doctor.name } }
    end

    assert_redirected_to doctor_url(Doctor.last)
  end

  test "should show doctor" do
    get doctor_url(@doctor)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_url(@doctor)
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: { doctor: { admission_date: @doctor.admission_date, clinic_id: @doctor.clinic_id, estate_id: @doctor.estate_id, last_name: @doctor.last_name, level_doctor_id: @doctor.level_doctor_id, name: @doctor.name } }
    assert_redirected_to doctor_url(@doctor)
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete doctor_url(@doctor)
    end

    assert_redirected_to doctors_url
  end
end
