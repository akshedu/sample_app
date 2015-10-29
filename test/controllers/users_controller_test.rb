require 'test_helper'

class UsersControllerTest < ActionController::TestCase
 
 def setup
 	@user = users(:akshansh)
  @other_user = users(:shalmali)
  @inactive_user = users(:garvit)
 end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | Sample App"
  end

  test "should redirect edit when not logged in" do
  	get :edit, id: @user
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
  	patch :update, id: @user, user: { name: @user.name, email: @user.email }
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

  test "should redirect when edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect when update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: {name: @user.name, email: @user.email}
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "shold redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

  test "should redirect when trying to access inactive user with login" do
    log_in_as(@user)
    get :show, id: @inactive_user
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect when trying to access activated user without login" do
    get :show, id: @user
    assert_not flash.empty?
    assert_redirected_to root_url
  end
   
end
