require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    get new_session_path
    assert_response :success
  end

  test 'should post create session page for admin' do
    admin = create :admin
    post session_path, params: {admin: { email: admin.email, password: admin.password }}
    assert_response :redirect

    assert_equal session[:admin_id], admin.id
  end

  test 'should not post create session page for admin' do
    admin = create :admin
    post session_path, params: {admin: { email: admin.email, password: 'bad_password'}}
    assert_response :success

    assert_nil session[:admin_id]
  end
end