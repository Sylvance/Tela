require "application_system_test_case"

class VotesTest < ApplicationSystemTestCase
  setup do
    @vote = votes(:one)
  end

  test "visiting the index" do
    visit votes_url
    assert_selector "h1", text: "Votes"
  end

  test "should create vote" do
    visit votes_url
    click_on "New vote"

    fill_in "Ballot type", with: @vote.ballot_type
    fill_in "Candidate", with: @vote.candidate_id
    fill_in "Counting station", with: @vote.counting_station_id
    fill_in "Election period", with: @vote.election_period_id
    fill_in "Electoral position", with: @vote.electoral_position_id
    fill_in "Picture", with: @vote.picture_id
    fill_in "Serial no", with: @vote.serial_no
    check "Valid vote" if @vote.valid_vote
    click_on "Create Vote"

    assert_text "Vote was successfully created"
    click_on "Back"
  end

  test "should update Vote" do
    visit vote_url(@vote)
    click_on "Edit this vote", match: :first

    fill_in "Ballot type", with: @vote.ballot_type
    fill_in "Candidate", with: @vote.candidate_id
    fill_in "Counting station", with: @vote.counting_station_id
    fill_in "Election period", with: @vote.election_period_id
    fill_in "Electoral position", with: @vote.electoral_position_id
    fill_in "Picture", with: @vote.picture_id
    fill_in "Serial no", with: @vote.serial_no
    check "Valid vote" if @vote.valid_vote
    click_on "Update Vote"

    assert_text "Vote was successfully updated"
    click_on "Back"
  end

  test "should destroy Vote" do
    visit vote_url(@vote)
    click_on "Destroy this vote", match: :first

    assert_text "Vote was successfully destroyed"
  end
end
