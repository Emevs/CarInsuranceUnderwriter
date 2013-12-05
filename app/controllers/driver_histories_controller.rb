class DriverHistoriesController < ApplicationController
  before_action :set_driver_history, only: [:show, :edit, :update, :destroy]

  # GET /driver_histories
  # GET /driver_histories.json
  def index
    @driver_histories = DriverHistory.all
  end

  # GET /driver_histories/1
  # GET /driver_histories/1.json
  def show
  end

  # GET /driver_histories/new
  def new
    @driver_history = DriverHistory.new
  end

  # GET /driver_histories/1/edit
  def edit
  end

  # POST /driver_histories
  # POST /driver_histories.json
  def create
    @driver_history = DriverHistory.new(driver_history_params)

    respond_to do |format|
      if @driver_history.save
        #format.html { redirect_to @driver_history, notice: 'Driver history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @driver_history }
      else
        #format.html { render action: 'new' }
        format.json { render json: @driver_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver_histories/1
  # PATCH/PUT /driver_histories/1.json
  def update
    respond_to do |format|
      if @driver_history.update(driver_history_params)
        #format.html { redirect_to @driver_history, notice: 'Driver history was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @driver_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_histories/1
  # DELETE /driver_histories/1.json
  def destroy
    @driver_history.destroy
    respond_to do |format|
      #format.html { redirect_to driver_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_history
      @driver_history = DriverHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_history_params
      params.require(:driver_history).permit(:number_of_incidents, :person_id)
    end
end
