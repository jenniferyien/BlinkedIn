class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def search
      # Search database by alumni, employers
    if params[:search]
      @alumnis = Alumni.where('name iLIKE ? OR first_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ? OR city iLIKE ? OR state iLIKE ? OR about iLIKE ? OR q1 iLIKE ? OR q2 iLIKE ? OR q3 iLIKE ? OR fun_fact iLIKE ? OR position iLIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").eager_load(:user, :location, :skills)
      @employers = Employer.where('city iLIKE ? OR state iLIKE ? OR company_name iLIKE ? OR company_type iLIKE ? OR website iLIKE ? OR description iLIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").eager_load(:location)
      @locations = Location.all
      @skills = Skill.all
    else
      @alumni = Alumni.all
      @employer = Employer.all
    end
    # @alumni = Alumni.all
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @alumnis = Alumni.all
    @employers = Employer.all

    # info for piechart on front page
    @alumninum = Alumni.all.count
    gon.watch.alumninum = @alumninum
    @employernum = Employer.all.count
    gon.watch.employernum = @employernum

    # compile all data in array
    @everything = [
      @alumninum, @employernum
    ]
    gon.watch.everything = @everything

    # info for bar chart, each skill count
    @jquery = Endorsement.where(skill_id: "6").count
    gon.watch.javascript = @jquery
    @javascript = Endorsement.where(skill_id: "1").count
    gon.watch.javascript = @javascript
    @rails = Endorsement.where(skill_id: "4").count
    gon.watch.rails = @rails
    @htmlcss = Endorsement.where(skill_id: "14").count
    gon.watch.htmlcss = @htmlcss
    @react = Endorsement.where(skill_id: "2").count
    gon.watch.react = @react
    @ajax = Endorsement.where(skill_id: "17").count
    gon.watch.ajax = @ajax
    @psql = Endorsement.where(skill_id: "18").count
    gon.watch.psql = @psql

    # compile all data in array
    @allskills = [
      @jquery, @javascript, @rails, @htmlcss, @react, @ajax, @psql
    ]
    gon.watch.allskills = @allskills

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
    @user.auth_hash = request.env['omniauth.auth']
    @user.uid = request.env['omniauth.auth']['uid']

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
