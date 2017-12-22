require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    post api_sessions_path, params: {session: {email: "", user_id: "", password: ""}}
    assert_not is_logged_in?
  end

  test "login with valid information" do
    get login_path
    post api_sessions_path, params: { session: 
                          {
                            email: @user.email, 
                            user_id: @user.user_id,
                            password: 'password'
                          }}
    assert is_logged_in?                          
  end  

  test "login with valid information followed by logout" do
    get login_path
    post api_sessions_path, params: { session: 
                          {
                            email: @user.email, 
                            user_id: @user.user_id,
                            password: 'password'
                          }}
    assert is_logged_in?   
    delete api_session_path(@user)
    assert_not is_logged_in?
  end
end
