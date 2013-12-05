class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.json { render action: 'show', status: :created, location: @address }
        #format.html { redirect_to @address, notice: 'Address was successfully created.' }
      else
        format.json { render json: @address.errors, status: :unprocessable_entity }
        #format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.json { head :no_content }
        #format.html { redirect_to @address, notice: 'Address was successfully updated.' }
      else
        format.json { render json: @address.errors, status: :unprocessable_entity }
        #format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.json { head :no_content }
      #format.html { redirect_to addresses_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.permit(:person_id, :house_name_or_number, :street_name, :county, :city, :postcode)
    end
end
