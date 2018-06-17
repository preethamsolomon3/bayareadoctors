module ConsultationsHelper

  def add_consultation_scheduler(timeslots)
    render partial: "simple_calendar/weekly_calendar_slots.html.erb", locals: { timeslots: timeslots }
  end

  def timeslot_position(timeslot)
    "top: #{ ( ( (timeslot.start_time - timeslot.start_time.midnight)/3600 - 8 ) * 40 ) + 28}px;"
  end

  def timeslot_height(timeslot)
    "height: #{ (timeslot.end_time - timeslot.start_time) * 40/3600}px;"
  end

end
