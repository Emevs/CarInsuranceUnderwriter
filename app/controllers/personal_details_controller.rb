class PersonalDetailsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /PersonalDetails
  # GET /PersonalDetails.json
  def index
    @personal_detail = PersonalDetail.all
  end

  # GET /PersonalDetails/1
  # GET /PersonalDetails/1.json
  def show
  end

  # GET /PersonalDetails/new
  def new
    @personal_detail = PersonalDetail.new
  end

  # GET /PersonalDetails/1/edit
  def edit
  end

  # POST /PersonalDetails
  # POST /PersonalDetails.json
  def create
    @personal_detail = PersonalDetail.new(personal_detail_params)
    #@personal_detail.user_id = User.find_by(:uuid, personal_detail_params[:uuid]).user_id
    @personal_detail.user_id = User.find_by(:uuid, params[:uuid]).user_id
    respond_to do |format|
      if @personal_detail.save
        #format.html { redirect_to @personal_details, notice: 'PersonalDetails was successfully created.' }
        format.json { render action: 'show', status: :created, location: @personal_detail }
      else
        #format.html { render action: 'new' }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /PersonalDetails/1
  # PATCH/PUT /PersonalDetails/1.json
  def update
    respond_to do |format|
      if @personal_detail.update(personal_detail_params, params[:uuid])
        #format.html { redirect_to @personal_detail, notice: 'PersonalDetails was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /PersonalDetails/1
  # DELETE /PersonalDetails/1.json
  def destroy
    @personal_detail.destroy(params[:uuid])
    respond_to do |format|
      #format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @personal_detail = PersonalDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_detail_params
      params.permit(:personal_detail, :title, :forenames, :surname, :email, :date_of_birth, :telephone_number, :license_type, :license_period, :occupation, :user_id)
    end


end
