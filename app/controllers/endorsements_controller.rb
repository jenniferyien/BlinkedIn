class EndorsementsController < ApplicationController
	before_action :set_endorsement, only: [:show, :destroy]
	respond_to :json

	def index
		@endorsement = Endorsement.all
	end

	def show
	end

	def new
		@endorsement = Endorsement.new
	end

	def create
		if 2+2 == 4
			raise
		else
	    @endorsement = Endorsement.new(endorsement_params)
			@endorsement.save
		end
  end



	def destroy
		@endorsement.destroy
		redirect_to '/', notice: 'Endorsement was successfully destroyed.'
	end


private

	def set_endorsement
    @endorsement = Endorsement.find(params[:id])
  end

	def endorsement_params
    params.require(:endorsement).permit(:user_id, :alumni_id, :skill_id)
  end

end
