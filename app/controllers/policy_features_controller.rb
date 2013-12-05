class PolicyFeaturesController < ApplicationController
  before_action :set_policy_feature, only: [:show, :edit, :update, :destroy]

  # GET /policy_features
  # GET /policy_features.json
  def index
    @policy_features = PolicyFeature.all
  end

  # GET /policy_features/1
  # GET /policy_features/1.json
  def show
  end

  # GET /policy_features/new
  def new
    @policy_feature = PolicyFeature.new
  end

  # GET /policy_features/1/edit
  def edit
  end

  # POST /policy_features
  # POST /policy_features.json
  def create
    @policy_feature = PolicyFeature.new(policy_feature_params)

    respond_to do |format|
      if @policy_feature.save
        #format.html { redirect_to @policy_feature, notice: 'Policy feature was successfully created.' }
        format.json { render action: 'show', status: :created, location: @policy_feature }
      else
        #format.html { render action: 'new' }
        format.json { render json: @policy_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policy_features/1
  # PATCH/PUT /policy_features/1.json
  def update
    respond_to do |format|
      if @policy_feature.update(policy_feature_params)
        #format.html { redirect_to @policy_feature, notice: 'Policy feature was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @policy_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policy_features/1
  # DELETE /policy_features/1.json
  def destroy
    @policy_feature.destroy
    respond_to do |format|
      #format.html { redirect_to policy_features_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy_feature
      @policy_feature = PolicyFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def policy_feature_params
      params.require(:policy_feature).permit(:vehicle_id, :policy_excess, :breakdown_cover, :windscreen_repair, :windscreen_excess)
    end
end
