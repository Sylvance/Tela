require "test_helper"

class SigninsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signin = signins(:one)
  end

  test "should get index" do
    get signins_url
    assert_response :success
  end

  test "should get new" do
    get new_signin_url
    assert_response :success
  end

  test "should create signin" do
    assert_difference("Signin.count") do
      post signins_url, params: { signin: { observer_id: @signin.observer_id, session_token: @signin.session_token } }
    end

    assert_redirected_to signin_url(Signin.last)
  end

  test "should show signin" do
    get signin_url(@signin)
    assert_response :success
  end

  test "should get edit" do
    get edit_signin_url(@signin)
    assert_response :success
  end

  test "should update signin" do
    patch signin_url(@signin), params: { signin: { observer_id: @signin.observer_id, session_token: @signin.session_token } }
    assert_redirected_to signin_url(@signin)
  end

  test "should destroy signin" do
    assert_difference("Signin.count", -1) do
      delete signin_url(@signin)
    end

    assert_redirected_to signins_url
  end
end
