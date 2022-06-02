require "test_helper"

class CountingStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counting_station = counting_stations(:one)
  end

  test "should get index" do
    get counting_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_counting_station_url
    assert_response :success
  end

  test "should create counting_station" do
    assert_difference("CountingStation.count") do
      post counting_stations_url, params: { counting_station: { location: @counting_station.location, name: @counting_station.name } }
    end

    assert_redirected_to counting_station_url(CountingStation.last)
  end

  test "should show counting_station" do
    get counting_station_url(@counting_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_counting_station_url(@counting_station)
    assert_response :success
  end

  test "should update counting_station" do
    patch counting_station_url(@counting_station), params: { counting_station: { location: @counting_station.location, name: @counting_station.name } }
    assert_redirected_to counting_station_url(@counting_station)
  end

  test "should destroy counting_station" do
    assert_difference("CountingStation.count", -1) do
      delete counting_station_url(@counting_station)
    end

    assert_redirected_to counting_stations_url
  end
end
