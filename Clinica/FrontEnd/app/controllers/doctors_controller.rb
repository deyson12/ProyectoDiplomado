class DoctorsController < ApplicationController
  before_action :logged_in?
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
    year = Date.parse(@doctor.admission_date).strftime("%Y")
    month = Date.parse(@doctor.admission_date).strftime("%m")
    day = Date.parse(@doctor.admission_date).strftime("%d")

    date_format = {"(1i)"=>year, "(2i)"=>month, "(3i)"=>day}
    @doctor.admission_date=Date.new(date_format['(1i)'].to_i, date_format['(2i)'].to_i, date_format['(3i)'].to_i)
  end

  # POST /doctors
  # POST /doctors.json
  def create
    date_format =  "#{doctor_params["admission_date(1i)"]}-#{doctor_params["admission_date(2i)"]}-#{doctor_params["admission_date(3i)"]}"
    @doctor = Doctor.new(name: doctor_params[:name], last_name: doctor_params[:last_name], admission_date: date_format,
    level_doctor_id: doctor_params[:level_doctor_id], estate_id: doctor_params[:estate_id], clinic_id: doctor_params[:clinic_id])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
    date_format =  "#{doctor_params["admission_date(1i)"]}-#{doctor_params["admission_date(2i)"]}-#{doctor_params["admission_date(3i)"]}"
    @doctor = Doctor.new(name: doctor_params[:name], last_name: doctor_params[:last_name], admission_date: date_format,
     level_doctor_id: doctor_params[:level_doctor_id], estate_id: doctor_params[:estate_id], clinic_id: doctor_params[:clinic_id])
      @doctor.id = params[:id]
      if @doctor.update
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:name, :last_name, :level_doctor_id, :estate_id, :admission_date, :clinic_id)
    end
end
