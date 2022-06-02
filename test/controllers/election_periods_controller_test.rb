require "test_helper"

class ElectionPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election_period = election_periods(:one)
  end

  test "should get index" do
    get election_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_election_period_url
    assert_response :success
  end

  test "should create election_period" do
    assert_difference("ElectionPeriod.count") do
      post election_periods_url, params: { election_period: { date: @election_period.date, name: @election_period.name } }
    end

    assert_redirected_to election_period_url(ElectionPeriod.last)
  end

  test "should show election_period" do
    get election_period_url(@election_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_election_period_url(@election_period)
    assert_response :success
  end

  test "should update election_period" do
    patch election_period_url(@election_period), params: { election_period: { date: @election_period.date, name: @election_period.name } }
    assert_redirected_to election_period_url(@election_period)
  end

  test "should destroy election_period" do
    assert_difference("ElectionPeriod.count", -1) do
      delete election_period_url(@election_period)
    end

    assert_redirected_to election_periods_url
  end
end
