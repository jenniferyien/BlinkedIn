class EndorsementsController < ApplicationController
	before_action :set_endorsement, only: [:show, :destroy]
	respond_to :json, :html

	def index
		@endorsements = Endorsement.all
	end

	def show
	end

	def new
		@endorsement = Endorsement.new
	end

	def create
		if Endorsement.find_by(endorsement_params)
			puts 'YYYYYYY'
		# elsif Endorsement.any? {|e| (e.user_id == current_user.id) && (e.alumni_id == endorsement_params.alumni_id) && (e.skill_id == endorsement_params.skill_id) }
		# 	puts 'ZZZZZZZ'
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
