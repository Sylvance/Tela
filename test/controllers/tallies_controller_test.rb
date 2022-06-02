require "test_helper"

class TalliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tally = tallies(:one)
  end

  test "should get index" do
    get tallies_url
    assert_response :success
  end

  test "should get new" do
    get new_tally_url
    assert_response :success
  end

  test "should create tally" do
    assert_difference("Tally.count") do
      post tallies_url, params: { tally: { candidate_id: @tally.candidate_id, counting_station_id: @tally.counting_station_id, total_count: @tally.total_count } }
    end

    assert_redirected_to tally_url(Tally.last)
  end

  test "should show tally" do
    get tally_url(@tally)
    assert_response :success
  end

  test "should get edit" do
    get edit_tally_url(@tally)
    assert_response :success
  end

  test "should update tally" do
    patch tally_url(@tally), params: { tally: { candidate_id: @tally.candidate_id, counting_station_id: @tally.counting_station_id, total_count: @tally.total_count } }
    assert_redirected_to tally_url(@tally)
  end

  test "should destroy tally" do
    assert_difference("Tally.count", -1) do
      delete tally_url(@tally)
    end

    assert_redirected_to tallies_url
  end
end
