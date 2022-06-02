require "application_system_test_case"

class ObserversTest < ApplicationSystemTestCase
  setup do
    @observer = observers(:one)
  end

  test "visiting the index" do
    visit observers_url
    assert_selector "h1", text: "Observers"
  end

  test "should create observer" do
    visit observers_url
    click_on "New observer"

    fill_in "Email", with: @observer.email
    fill_in "Name", with: @observer.name
    fill_in "Password digest", with: @observer.password_digest
    click_on "Create Observer"

    assert_text "Observer was successfully created"
    click_on "Back"
  end

  test "should update Observer" do
    visit observer_url(@observer)
    click_on "Edit this observer", match: :first

    fill_in "Email", with: @observer.email
    fill_in "Name", with: @observer.name
    fill_in "Password digest", with: @observer.password_digest
    click_on "Update Observer"

    assert_text "Observer was successfully updated"
    click_on "Back"
  end

  test "should destroy Observer" do
    visit observer_url(@observer)
    click_on "Destroy this observer", match: :first

    assert_text "Observer was successfully destroyed"
  end
end
