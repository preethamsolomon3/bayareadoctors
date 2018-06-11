class AvailabilityPeriodsController < ApplicationController
  before_action :set_availability_period, only: [:show, :edit, :update, :destroy]

  # GET /availability_periods
  # GET /availability_periods.json
  def index
    @availability_periods = AvailabilityPeriod.all
  end

  # GET /availability_periods/1
  # GET /availability_periods/1.json
  def show
  end

  # GET /availability_periods/new
  def new
    @availability_period = AvailabilityPeriod.new
  end

  # GET /availability_periods/1/edit
  def edit
  end

  # POST /availability_periods
  # POST /availability_periods.json
  def create
    @availability_period = AvailabilityPeriod.new(availability_period_params)

    respond_to do |format|
      if @availability_period.save
        format.html { redirect_to @availability_period, notice: 'Availability period was successfully created.' }
        format.json { render :show, status: :created, location: @availability_period }
      else
        format.html { render :new }
        format.json { render json: @availability_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availability_periods/1
  # PATCH/PUT /availability_periods/1.json
  def update
    respond_to do |format|
      if @availability_period.update(availability_period_params)
        format.html { redirect_to @availability_period, notice: 'Availability period was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability_period }
      else
        format.html { render :edit }
        format.json { render json: @availability_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availability_periods/1
  # DELETE /availability_periods/1.json
  def destroy
    @availability_period.destroy
    respond_to do |format|
      format.html { redirect_to availability_periods_url, notice: 'Availability period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability_period
      @availability_period = AvailabilityPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_period_params
      params.require(:availability_period).permit(:start_time, :end_time)
    end
end
