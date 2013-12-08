class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find_by quote_reference: params[:quote_reference]
    @vehicle = Vehicle.find_by id: @quote.vehicle_id
    @policy_feature = PolicyFeature.find_by vehicle_id: @vehicle.id

    respond_to do |format|
      format.json { render action: 'show', status: :created, location: @quote }
    end
  end

  # GET /quotes/new
  def new
    @quote = Quote.new(quote_params)
    @user = User.find_by uuid: params[:uuid]
    @vehicle = Vehicle.find_by user_id: @user.id
    @quote.vehicle_id = @vehicle.id
    @policy_feature = PolicyFeature.find_by vehicle_id: @vehicle.id

    @quote.amount = Random.rand(2000-100)
    @quote.quote_reference = "Quoteref-"+@user.id.to_s+"-"+@vehicle.id.to_s+"-"+Date.today.to_s+"-"+Random.rand(100-1).to_s

    respond_to do |format|
      format.json { render action: 'show', status: :created, location: @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    @user = User.find_by uuid: params[:uuid]
    @vehicle = Vehicle.find_by user_id: @user.id
    @quote.vehicle_id = @vehicle.id

    respond_to do |format|
          if @quote.save
            #format.html { redirect_to @driver_history, notice: 'Driver history was successfully created.' }
            format.json { render action: 'show', status: :created, location: @quote }
          else
            #format.html { render action: 'new' }
            format.json { render json: @quote.errors, status: :unprocessable_entity }
          end
    end

  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        #format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      #format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.permit(:quote_reference, :amount, :vehicle_id)
    end
end
