class LevelDoctorsController < ApplicationController
  before_action :set_level_doctor, only: [:show, :edit, :update, :destroy]

  # GET /level_doctors
  # GET /level_doctors.json
  def index
    @level_doctors = LevelDoctor.all
  end

  # GET /level_doctors/1
  # GET /level_doctors/1.json
  def show
  end

  # GET /level_doctors/new
  def new
    @level_doctor = LevelDoctor.new
  end

  # GET /level_doctors/1/edit
  def edit
  end

  # POST /level_doctors
  # POST /level_doctors.json
  def create
    @level_doctor = LevelDoctor.new(level_doctor_params)

    respond_to do |format|
      if @level_doctor.save
        format.html { redirect_to @level_doctor, notice: 'Level doctor was successfully created.' }
        format.json { render :show, status: :created, location: @level_doctor }
      else
        format.html { render :new }
        format.json { render json: @level_doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_doctors/1
  # PATCH/PUT /level_doctors/1.json
  def update
    respond_to do |format|
      if @level_doctor.update(level_doctor_params)
        format.html { redirect_to @level_doctor, notice: 'Level doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_doctor }
      else
        format.html { render :edit }
        format.json { render json: @level_doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_doctors/1
  # DELETE /level_doctors/1.json
  def destroy
    @level_doctor.destroy
    respond_to do |format|
      format.html { redirect_to level_doctors_url, notice: 'Level doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_doctor
      @level_doctor = LevelDoctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_doctor_params
      params.require(:level_doctor).permit(:name, :description)
    end
end
