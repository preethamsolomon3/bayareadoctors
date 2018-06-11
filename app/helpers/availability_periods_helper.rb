module AvailabilityPeriodsHelper

  def add_weekly_calendar(availability_periods)
    render partial: "simple_calendar/weekly_calendar_availability", locals: { availability_periods: availability_periods }
  end

  def availability_position(availability_period)
    "top: #{ ( ( (availability_period.start_time - availability_period.start_time.midnight)/3600 - 8 ) * 40 ) + 28}px;"
  end
  
  def availability_height(availability_period)
    "height: #{(availability_period.end_time - availability_period.start_time) * 40/3600}px;"
  end

end
