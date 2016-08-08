class TypeIdentificationsController < ApplicationController
  before_action :logged_in?
  before_action :set_type_identification, only: [:show, :edit, :update, :destroy]

  # GET /type_identifications
  # GET /type_identifications.json
  def index
    @type_identifications = TypeIdentification.all
  end

  # GET /type_identifications/1
  # GET /type_identifications/1.json
  def show
  end

  # GET /type_identifications/new
  def new
    @type_identification = TypeIdentification.new
  end

  # GET /type_identifications/1/edit
  def edit
  end

  # POST /type_identifications
  # POST /type_identifications.json
  def create
    @type_identification = TypeIdentification.new(type_identification_params)

    respond_to do |format|
      if @type_identification.save
        format.html { redirect_to @type_identification, notice: 'Type identification was successfully created.' }
        format.json { render :show, status: :created, location: @type_identification }
      else
        format.html { render :new }
        format.json { render json: @type_identification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_identifications/1
  # PATCH/PUT /type_identifications/1.json
  def update
    @type_identification = TypeIdentification.new(type_identification_params)
    @type_identification.id = params[:id]
    respond_to do |format|
      if @type_identification.update
        format.html { redirect_to @type_identification, notice: 'Type identification was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_identification }
      else
        format.html { render :edit }
        format.json { render json: @type_identification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_identifications/1
  # DELETE /type_identifications/1.json
  def destroy
    @type_identification.destroy
    respond_to do |format|
      format.html { redirect_to type_identifications_url, notice: 'Type identification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_identification
      @type_identification = TypeIdentification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_identification_params
      params.require(:type_identification).permit(:codigo, :description)
    end
end
