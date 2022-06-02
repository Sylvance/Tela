require "application_system_test_case"

class SigninsTest < ApplicationSystemTestCase
  setup do
    @signin = signins(:one)
  end

  test "visiting the index" do
    visit signins_url
    assert_selector "h1", text: "Signins"
  end

  test "should create signin" do
    visit signins_url
    click_on "New signin"

    fill_in "Observer", with: @signin.observer_id
    fill_in "Session token", with: @signin.session_token
    click_on "Create Signin"

    assert_text "Signin was successfully created"
    click_on "Back"
  end

  test "should update Signin" do
    visit signin_url(@signin)
    click_on "Edit this signin", match: :first

    fill_in "Observer", with: @signin.observer_id
    fill_in "Session token", with: @signin.session_token
    click_on "Update Signin"

    assert_text "Signin was successfully updated"
    click_on "Back"
  end

  test "should destroy Signin" do
    visit signin_url(@signin)
    click_on "Destroy this signin", match: :first

    assert_text "Signin was successfully destroyed"
  end
end
