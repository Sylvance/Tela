require "application_system_test_case"

class TalliesTest < ApplicationSystemTestCase
  setup do
    @tally = tallies(:one)
  end

  test "visiting the index" do
    visit tallies_url
    assert_selector "h1", text: "Tallies"
  end

  test "should create tally" do
    visit tallies_url
    click_on "New tally"

    fill_in "Candidate", with: @tally.candidate_id
    fill_in "Counting station", with: @tally.counting_station_id
    fill_in "Total count", with: @tally.total_count
    click_on "Create Tally"

    assert_text "Tally was successfully created"
    click_on "Back"
  end

  test "should update Tally" do
    visit tally_url(@tally)
    click_on "Edit this tally", match: :first

    fill_in "Candidate", with: @tally.candidate_id
    fill_in "Counting station", with: @tally.counting_station_id
    fill_in "Total count", with: @tally.total_count
    click_on "Update Tally"

    assert_text "Tally was successfully updated"
    click_on "Back"
  end

  test "should destroy Tally" do
    visit tally_url(@tally)
    click_on "Destroy this tally", match: :first

    assert_text "Tally was successfully destroyed"
  end
end
