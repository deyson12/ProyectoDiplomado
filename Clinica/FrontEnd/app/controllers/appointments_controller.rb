class AppointmentsController < ApplicationController
  before_action :logged_in?
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    year = Date.parse(@appointment.date).strftime("%Y")
    month = Date.parse(@appointment.date).strftime("%m")
    day = Date.parse(@appointment.date).strftime("%d")

    date_format = {"(1i)"=>year, "(2i)"=>month, "(3i)"=>day}
    @appointment.date=Date.new(date_format['(1i)'].to_i, date_format['(2i)'].to_i, date_format['(3i)'].to_i)
  end

  # POST /appointments
  # POST /appointments.json
  def create
    date_format =  "#{appointment_params["date(1i)"]}-#{appointment_params["date(2i)"]}-#{appointment_params["date(3i)"]}"
    @appointment = Appointment.new(type_appointment_id: appointment_params[:type_appointment_id], description: appointment_params[:description], date: date_format,
    user_id: appointment_params[:user_id], estate_id: appointment_params[:estate_id], doctor_id: appointment_params[:doctor_id])
    
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    date_format =  "#{appointment_params["date(1i)"]}-#{appointment_params["date(2i)"]}-#{appointment_params["date(3i)"]}"
    @appointment = Appointment.new(type_appointment_id: appointment_params[:type_appointment_id], description: appointment_params[:description], date: date_format,
    user_id: appointment_params[:user_id], estate_id: appointment_params[:estate_id], doctor_id: appointment_params[:doctor_id])
    
    respond_to do |format|
      if @appointment.update
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:type_appointment, :description, :user, :doctor, :estate, :date)
    end
end
