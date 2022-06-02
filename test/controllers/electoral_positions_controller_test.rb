require "test_helper"

class ElectoralPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @electoral_position = electoral_positions(:one)
  end

  test "should get index" do
    get electoral_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_electoral_position_url
    assert_response :success
  end

  test "should create electoral_position" do
    assert_difference("ElectoralPosition.count") do
      post electoral_positions_url, params: { electoral_position: { jurisdiction: @electoral_position.jurisdiction, name: @electoral_position.name } }
    end

    assert_redirected_to electoral_position_url(ElectoralPosition.last)
  end

  test "should show electoral_position" do
    get electoral_position_url(@electoral_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_electoral_position_url(@electoral_position)
    assert_response :success
  end

  test "should update electoral_position" do
    patch electoral_position_url(@electoral_position), params: { electoral_position: { jurisdiction: @electoral_position.jurisdiction, name: @electoral_position.name } }
    assert_redirected_to electoral_position_url(@electoral_position)
  end

  test "should destroy electoral_position" do
    assert_difference("ElectoralPosition.count", -1) do
      delete electoral_position_url(@electoral_position)
    end

    assert_redirected_to electoral_positions_url
  end
end
