require "application_system_test_case"

class ElectoralPositionsTest < ApplicationSystemTestCase
  setup do
    @electoral_position = electoral_positions(:one)
  end

  test "visiting the index" do
    visit electoral_positions_url
    assert_selector "h1", text: "Electoral positions"
  end

  test "should create electoral position" do
    visit electoral_positions_url
    click_on "New electoral position"

    fill_in "Jurisdiction", with: @electoral_position.jurisdiction
    fill_in "Name", with: @electoral_position.name
    click_on "Create Electoral position"

    assert_text "Electoral position was successfully created"
    click_on "Back"
  end

  test "should update Electoral position" do
    visit electoral_position_url(@electoral_position)
    click_on "Edit this electoral position", match: :first

    fill_in "Jurisdiction", with: @electoral_position.jurisdiction
    fill_in "Name", with: @electoral_position.name
    click_on "Update Electoral position"

    assert_text "Electoral position was successfully updated"
    click_on "Back"
  end

  test "should destroy Electoral position" do
    visit electoral_position_url(@electoral_position)
    click_on "Destroy this electoral position", match: :first

    assert_text "Electoral position was successfully destroyed"
  end
end
