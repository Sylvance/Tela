require "test_helper"

class ObserversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @observer = observers(:one)
  end

  test "should get index" do
    get observers_url
    assert_response :success
  end

  test "should get new" do
    get new_observer_url
    assert_response :success
  end

  test "should create observer" do
    assert_difference("Observer.count") do
      post observers_url, params: { observer: { email: @observer.email, name: @observer.name, password_digest: @observer.password_digest } }
    end

    assert_redirected_to observer_url(Observer.last)
  end

  test "should show observer" do
    get observer_url(@observer)
    assert_response :success
  end

  test "should get edit" do
    get edit_observer_url(@observer)
    assert_response :success
  end

  test "should update observer" do
    patch observer_url(@observer), params: { observer: { email: @observer.email, name: @observer.name, password_digest: @observer.password_digest } }
    assert_redirected_to observer_url(@observer)
  end

  test "should destroy observer" do
    assert_difference("Observer.count", -1) do
      delete observer_url(@observer)
    end

    assert_redirected_to observers_url
  end
end
