class PersonalDetailsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /personal_details
  # GET /personal_details.json
  def index
    @personal_detail = PersonalDetail.all
  end

  # GET /personal_details/1
  # GET /personal_details/1.json
  def show
  end

  # GET /personal_details/new
  def new
    @personal_detail = PersonalDetail.new
  end

  # GET /personal_details/1/edit
  def edit
  end

  # POST /personal_details
  # POST /personal_details.json
  def create
    @personal_detail = PersonalDetail.new(personal_detail_params)

    @user = User.find_by uuid: params[:uuid]
    @personal_detail.user_id = @user.id
    respond_to do |format|
      if @personal_detail.save

        format.json {render action: 'show', status: :created, location: @personal_detail }
      else
        #format.html { render action: 'new' }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_details/1
  # PATCH/PUT /personal_details/1.json
  def update
    respond_to do |format|
      if @personal_detail.update(personal_detail_params, params[:uuid])
        #format.html { redirect_to @personal_detail, notice: 'personal_details was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_details/1
  # DELETE /personal_details/1.json
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
