require 'bcrypt'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = BCrypt::Password.create(params[:password], :cost =>5)
    @user.uuid = SecureRandom.uuid

    respond_to do |format|
      if @user.save
        format.json {render action: 'show', status: :created, location: @user}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/login
  def login
    @user = User.find_by username: params[:username]
    if !@user.nil? && @user.password == BCrypt::Password.create(params[:password], :cost =>5)
      # Reset user to null, so nothing is returned to the broker, which will then handle error messages.
      @user = '';
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { head :no_content }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:uuid, :username, :password)
    end
end
