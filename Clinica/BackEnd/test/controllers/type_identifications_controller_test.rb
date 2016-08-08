require 'test_helper'

class TypeIdentificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_identification = type_identifications(:one)
  end

  test "should get index" do
    get type_identifications_url
    assert_response :success
  end

  test "should get new" do
    get new_type_identification_url
    assert_response :success
  end

  test "should create type_identification" do
    assert_difference('TypeIdentification.count') do
      post type_identifications_url, params: { type_identification: { codigo: @type_identification.codigo, description: @type_identification.description } }
    end

    assert_redirected_to type_identification_url(TypeIdentification.last)
  end

  test "should show type_identification" do
    get type_identification_url(@type_identification)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_identification_url(@type_identification)
    assert_response :success
  end

  test "should update type_identification" do
    patch type_identification_url(@type_identification), params: { type_identification: { codigo: @type_identification.codigo, description: @type_identification.description } }
    assert_redirected_to type_identification_url(@type_identification)
  end

  test "should destroy type_identification" do
    assert_difference('TypeIdentification.count', -1) do
      delete type_identification_url(@type_identification)
    end

    assert_redirected_to type_identifications_url
  end
end
