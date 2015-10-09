class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def search
      if params[:search]
        @alumnis = Alumni.where("name LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR city LIKE ? OR state LIKE ? OR about LIKE ? OR q1 LIKE ? OR q2 LIKE ? OR q3 LIKE ? OR fun_fact LIKE ? OR position LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").eager_load(:user, :location, :skills)
        @employers = Employer.where("city LIKE ? OR state LIKE ? OR company_name LIKE ? OR company_type LIKE ? OR website LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").eager_load(:location)
        @locations = Location.all
      else
        @alumni = Alumni.all()
        @employer = Employer.all()
      end
    # @alumni = Alumni.all
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @alumnis = Alumni.all
    @employers = Employer.all

    @usernum = User.all.count
    gon.watch.usernum = @usernum
    @alumninum = Alumni.all.count
    gon.watch.alumninum = @alumninum
    @employernum = Employer.all.count
    gon.watch.employernum = @employernum

    @everything = [
      @usernum, @alumninum, @employernum
    ]
    gon.watch.everything = @everything

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
    @user.auth_hash = request.env["omniauth.auth"]
    @user.uid = request.env["omniauth.auth"]['uid']

    respond_to do |format|
      if @user.save

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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

      params.require(:user).permit(:first_name, :last_name, :email, :auth_hash, :uid)



    end
end
