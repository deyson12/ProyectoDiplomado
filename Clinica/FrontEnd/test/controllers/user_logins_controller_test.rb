require 'test_helper'

class UserLoginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_login = user_logins(:one)
  end

  test "should get index" do
    get user_logins_url
    assert_response :success
  end

  test "should get new" do
    get new_user_login_url
    assert_response :success
  end

  test "should create user_login" do
    assert_difference('UserLogin.count') do
      post user_logins_url, params: { user_login: { avatar_url: @user_login.avatar_url, birth_date: @user_login.birth_date, email: @user_login.email, estatus: @user_login.estatus, identification: @user_login.identification, last_name: @user_login.last_name, name: @user_login.name, password_digest: @user_login.password_digest, phone: @user_login.phone, user_name: @user_login.user_name } }
    end

    assert_redirected_to user_login_url(UserLogin.last)
  end

  test "should show user_login" do
    get user_login_url(@user_login)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_login_url(@user_login)
    assert_response :success
  end

  test "should update user_login" do
    patch user_login_url(@user_login), params: { user_login: { avatar_url: @user_login.avatar_url, birth_date: @user_login.birth_date, email: @user_login.email, estatus: @user_login.estatus, identification: @user_login.identification, last_name: @user_login.last_name, name: @user_login.name, password_digest: @user_login.password_digest, phone: @user_login.phone, user_name: @user_login.user_name } }
    assert_redirected_to user_login_url(@user_login)
  end

  test "should destroy user_login" do
    assert_difference('UserLogin.count', -1) do
      delete user_login_url(@user_login)
    end

    assert_redirected_to user_logins_url
  end
end
