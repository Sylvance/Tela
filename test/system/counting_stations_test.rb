require "application_system_test_case"

class CountingStationsTest < ApplicationSystemTestCase
  setup do
    @counting_station = counting_stations(:one)
  end

  test "visiting the index" do
    visit counting_stations_url
    assert_selector "h1", text: "Counting stations"
  end

  test "should create counting station" do
    visit counting_stations_url
    click_on "New counting station"

    fill_in "Location", with: @counting_station.location
    fill_in "Name", with: @counting_station.name
    click_on "Create Counting station"

    assert_text "Counting station was successfully created"
    click_on "Back"
  end

  test "should update Counting station" do
    visit counting_station_url(@counting_station)
    click_on "Edit this counting station", match: :first

    fill_in "Location", with: @counting_station.location
    fill_in "Name", with: @counting_station.name
    click_on "Update Counting station"

    assert_text "Counting station was successfully updated"
    click_on "Back"
  end

  test "should destroy Counting station" do
    visit counting_station_url(@counting_station)
    click_on "Destroy this counting station", match: :first

    assert_text "Counting station was successfully destroyed"
  end
end
