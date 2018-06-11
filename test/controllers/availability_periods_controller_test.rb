require 'test_helper'

class AvailabilityPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @availability_period = availability_periods(:one)
  end

  test "should get index" do
    get availability_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_availability_period_url
    assert_response :success
  end

  test "should create availability_period" do
    assert_difference('AvailabilityPeriod.count') do
      post availability_periods_url, params: { availability_period: { end_time: @availability_period.end_time, start_time: @availability_period.start_time } }
    end

    assert_redirected_to availability_period_url(AvailabilityPeriod.last)
  end

  test "should show availability_period" do
    get availability_period_url(@availability_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_availability_period_url(@availability_period)
    assert_response :success
  end

  test "should update availability_period" do
    patch availability_period_url(@availability_period), params: { availability_period: { end_time: @availability_period.end_time, start_time: @availability_period.start_time } }
    assert_redirected_to availability_period_url(@availability_period)
  end

  test "should destroy availability_period" do
    assert_difference('AvailabilityPeriod.count', -1) do
      delete availability_period_url(@availability_period)
    end

    assert_redirected_to availability_periods_url
  end
end
