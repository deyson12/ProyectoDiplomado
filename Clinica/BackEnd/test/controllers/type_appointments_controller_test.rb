require 'test_helper'

class TypeAppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_appointment = type_appointments(:one)
  end

  test "should get index" do
    get type_appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_type_appointment_url
    assert_response :success
  end

  test "should create type_appointment" do
    assert_difference('TypeAppointment.count') do
      post type_appointments_url, params: { type_appointment: { codigo: @type_appointment.codigo, description: @type_appointment.description, priority: @type_appointment.priority } }
    end

    assert_redirected_to type_appointment_url(TypeAppointment.last)
  end

  test "should show type_appointment" do
    get type_appointment_url(@type_appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_appointment_url(@type_appointment)
    assert_response :success
  end

  test "should update type_appointment" do
    patch type_appointment_url(@type_appointment), params: { type_appointment: { codigo: @type_appointment.codigo, description: @type_appointment.description, priority: @type_appointment.priority } }
    assert_redirected_to type_appointment_url(@type_appointment)
  end

  test "should destroy type_appointment" do
    assert_difference('TypeAppointment.count', -1) do
      delete type_appointment_url(@type_appointment)
    end

    assert_redirected_to type_appointments_url
  end
end
