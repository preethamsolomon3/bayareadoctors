class StaticPagesController < ApplicationController
  def home

    @availability_periods = AvailabilityPeriod.all

  end

  def help
  end

  def about
  end

  def contact
  end
end
