require "application_system_test_case"

class AvailabilityPeriodsTest < ApplicationSystemTestCase
  setup do
    @availability_period = availability_periods(:one)
  end

  test "visiting the index" do
    visit availability_periods_url
    assert_selector "h1", text: "Availability Periods"
  end

  test "creating a Availability period" do
    visit availability_periods_url
    click_on "New Availability Period"

    fill_in "End Time", with: @availability_period.end_time
    fill_in "Start Time", with: @availability_period.start_time
    click_on "Create Availability period"

    assert_text "Availability period was successfully created"
    click_on "Back"
  end

  test "updating a Availability period" do
    visit availability_periods_url
    click_on "Edit", match: :first

    fill_in "End Time", with: @availability_period.end_time
    fill_in "Start Time", with: @availability_period.start_time
    click_on "Update Availability period"

    assert_text "Availability period was successfully updated"
    click_on "Back"
  end

  test "destroying a Availability period" do
    visit availability_periods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Availability period was successfully destroyed"
  end
end
