class TypeAppointmentsController < ApplicationController
  before_action :logged_in?
  before_action :set_type_appointment, only: [:show, :edit, :update, :destroy]

  # GET /type_appointments
  # GET /type_appointments.json
  def index
    @type_appointments = TypeAppointment.all
  end

  # GET /type_appointments/1
  # GET /type_appointments/1.json
  def show
  end

  # GET /type_appointments/new
  def new
    @type_appointment = TypeAppointment.new
  end

  # GET /type_appointments/1/edit
  def edit
  end

  # POST /type_appointments
  # POST /type_appointments.json
  def create
    @type_appointment = TypeAppointment.new(type_appointment_params)

    respond_to do |format|
      if @type_appointment.save
        format.html { redirect_to @type_appointment, notice: 'Type appointment was successfully created.' }
        format.json { render :show, status: :created, location: @type_appointment }
      else
        format.html { render :new }
        format.json { render json: @type_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_appointments/1
  # PATCH/PUT /type_appointments/1.json
  def update
    @type_appointment = TypeAppointment.new(type_appointment_params)
    @type_appointment.id = params[:id]
    respond_to do |format|
      if @type_appointment.update
        format.html { redirect_to @type_appointment, notice: 'Type appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_appointment }
      else
        format.html { render :edit }
        format.json { render json: @type_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_appointments/1
  # DELETE /type_appointments/1.json
  def destroy
    @type_appointment.destroy
    respond_to do |format|
      format.html { redirect_to type_appointments_url, notice: 'Type appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_appointment
      @type_appointment = TypeAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_appointment_params
      params.require(:type_appointment).permit(:codigo, :description, :priority)
    end
end
