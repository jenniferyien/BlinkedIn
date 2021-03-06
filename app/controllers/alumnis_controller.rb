class AlumnisController < ApplicationController
  before_action :set_alumni, only: [:show, :edit, :update, :destroy]
  # before_filter :allow_iframe_requests
  after_action :allow_iframe, only: :iframe


  # def allow_iframe_requests
  # response.headers.delete('X-Frame-Options')
  # end
  # GET /alumnis
  # GET /alumnis.json

  # GET /alumnis/1
  # GET /alumnis/1.json
  def show
    @alumni = Alumni.find_by(id: params[:id])
    if @alumni.view
      @alumni.view += 1
    else
      @alumni.view = 1
    end
    @alumni.save
  end

  # GET /alumnis/new
  def new
    @alumniperson = Alumni.find_by(user_id: current_user.id)
    @employerperson = Employer.find_by(user_id: current_user.id)
    if @alumniperson || @employerperson
      redirect_to '/'
    else
    @alumni = Alumni.new
    @alumni.user_id = current_user.id
    @alumni.projects.build
    end
  end

  # GET /alumnis/1/edit
  def edit
    @alumni = Alumni.find(params[:id])
    if current_user.id != @alumni.user_id
      redirect_to '/'
    end
    @alumni.projects.build
  end

  # POST /alumnis
  # POST /alumnis.json
  def create
    @alumni = Alumni.new(alumni_params)
    @alumni.user_id = current_user.id

      if @alumni.save
          redirect_to alumni_path(@alumni.id), notice: 'Alumni was successfully created.'
      end
  end

  # PATCH/PUT /alumnis/1
  # PATCH/PUT /alumnis/1.json
  def update
      if @alumni.update(alumni_params)
        redirect_to alumni_path(@alumni.id), notice: 'Alumni was successfully created.'
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
    params.require(:alumni).permit(:user_id, :location_id, :about, :q1, :q2, :q3, :position, :view, :fun_fact, :resume, :avatar, { skill_ids: [] }, projects_attributes: [:id, :alumni_id, :name, :url, :description, :_destroy])
  end

  def allow_iframe
  response.headers['X-Frame-Options'] = "ALLOWALL"
  end

end
