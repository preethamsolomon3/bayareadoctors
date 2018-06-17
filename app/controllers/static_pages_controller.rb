class StaticPagesController < ApplicationController
  def home

    @availability_periods = AvailabilityPeriod.all
    @consultations = Consultation.all
    @timeslots = []
    interval = AvailabilityPeriod::INTERVAL

    @availability_periods.each do |availability_period|
      start_time = availability_period.start_time
      end_time = availability_period.end_time

      while start_time < end_time
        if (!Consultation.exists?(start_time: start_time))
          timeslot = TimeSlot.new
          timeslot.start_time = start_time
          timeslot.end_time   = start_time + (interval).minutes
          @timeslots.push(timeslot)
        end
        start_time += (interval).minutes
      end
    end

  end

  def help
  end

  def about
  end

  def contact
  end
end
