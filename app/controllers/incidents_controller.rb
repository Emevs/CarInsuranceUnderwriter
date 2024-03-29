class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)
    @user = User.find_by uuid: params[:uuid]
    @driver_history = DriverHistory.find_by user_id: @user.id
    @incident.driver_history_id = @driver_history.id
    respond_to do |format|
      if @incident.save
        #format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render action: 'show', status: :created, location: @incident }
      else
        #format.html { render action: 'new' }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        #format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      #format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.permit(:driver_history_id, :date_of_incident, :claim_value, :incident_type, :description)
    end
end
