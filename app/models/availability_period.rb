class AvailabilityPeriod < ApplicationRecord
  #belongs_to :user
  INTERVAL=20

  ## Validations

  class AvailabilityPeriodValidator 
    def initialize(availability_period)
      @availability_period = availability_period
      #@user = availability_period.user
    end
    
    def validate

      # disallow creating availability period more than six months in the future
      if @availability_period.start_time > (Date.today + 6.months).end_of_day
        @availability_period.errors.add("Cannot schedule availability more than six months from now.")
      end

      # disallow creating availability period too soon
      if @availability_period.start_time < (Date.today).end_of_day
        @availability_period.errors.add("Cannot schedule availability too soon.")
      end
 
      # select all availability periods scheduled by the user
      #availability_periods = @user.availability_periods
      availability_periods = AvailabilityPeriod.all

      # prevent overlap with availability periods that have already been scheduled by the user
      availability_periods.each do |availability_period| 
        if availability_period.start_time <= @availability_period.start_time && @availability_period.start_time <= availability_period.end_time || 
           @availability_period.start_time <= availability_period.start_time && availability_period.start_time <= @availability_period.end_time
          @availability_period.errors.add(:start_time, "is not available.")
        end
      end
      
    end
    
  end
  
  validate do |availability_period| 
    AvailabilityPeriodValidator.new(availability_period).validate
  end
  

end
