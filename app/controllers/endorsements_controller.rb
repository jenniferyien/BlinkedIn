class EndorsementsController < ApplicationController

	def new
		@endorsement = Endorsement.new
	end

	def create
    @endorsement = Endorsement.new(endorsement_params)
    @endorsement.user_id = current_user.id
    if @employer.save
      notice: 'Successfully endorsed.'
    else
      render :new
    end
  end

	def destroy
		@endorsement.destroy
		redirect_to '/', notice: 'Employer was successfully destroyed.'
	end

private

	def set_endorsement
    @endorsement = Endorsement.find(params[:id])
  end

	def endorsement_params
    params.require(:endorsement).permit(:user_id, :alumni_id, :skill)
  end

end
