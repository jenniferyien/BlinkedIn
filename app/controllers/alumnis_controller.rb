class AlumnisController < ApplicationController
  before_action :set_alumni, only: [:show, :edit, :update, :destroy]

  # GET /alumnis
  # GET /alumnis.json
  def index
    @alumnis = Alumni.all
  end

  # GET /alumnis/1
  # GET /alumnis/1.json
  def show
  end

  # GET /alumnis/new
  def new
    @alumni = Alumni.new
  end

  # GET /alumnis/1/edit
  def edit
    @alumni = Alumni.find(params[:id])
  end

  # POST /alumnis
  # POST /alumnis.json
  def create
    @alumni = Alumni.new(alumni_params)
    @alumni.user_id = current_user.id
    respond_to do |format|
      if @alumni.save
        format.html { redirect_to @alumni, notice: 'Alumni was successfully created.' }
        format.json { render :show, status: :created, location: @alumni }
      else
        format.html { render :new }
        format.json { render json: @alumni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumnis/1
  # PATCH/PUT /alumnis/1.json
  def update
    respond_to do |format|
      if @alumni.update(alumni_params)
        format.html { redirect_to @alumni, notice: 'Alumni was successfully updated.' }
        format.json { render :show, status: :ok, location: @alumni }
      else
        format.html { render :edit }
        format.json { render json: @alumni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnis/1
  # DELETE /alumnis/1.json
  def destroy
    @alumni.destroy
    respond_to do |format|
      format.html { redirect_to alumnis_url, notice: 'Alumni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumni
      @alumni = Alumni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alumni_params
      params.require(:alumni).permit(:user_id, :location_id, :about, :q1, :q2, :q3, :position, :view, :fun_fact, :avatar, projects_attributes: [:alumni_id, :name, :url, :description])
    end

end
