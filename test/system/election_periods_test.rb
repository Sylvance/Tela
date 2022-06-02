require "application_system_test_case"

class ElectionPeriodsTest < ApplicationSystemTestCase
  setup do
    @election_period = election_periods(:one)
  end

  test "visiting the index" do
    visit election_periods_url
    assert_selector "h1", text: "Election periods"
  end

  test "should create election period" do
    visit election_periods_url
    click_on "New election period"

    fill_in "Date", with: @election_period.date
    fill_in "Name", with: @election_period.name
    click_on "Create Election period"

    assert_text "Election period was successfully created"
    click_on "Back"
  end

  test "should update Election period" do
    visit election_period_url(@election_period)
    click_on "Edit this election period", match: :first

    fill_in "Date", with: @election_period.date
    fill_in "Name", with: @election_period.name
    click_on "Update Election period"

    assert_text "Election period was successfully updated"
    click_on "Back"
  end

  test "should destroy Election period" do
    visit election_period_url(@election_period)
    click_on "Destroy this election period", match: :first

    assert_text "Election period was successfully destroyed"
  end
end
