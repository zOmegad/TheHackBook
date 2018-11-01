class GossipsController < ApplicationController


	def index
		@gossips = Gossip.all
	end

	def new
		@gossip = Gossip.new
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		respond_to do |format|
      		if @gossip.update(gossip_params)
        		format.html { redirect_to gossip_path(@gossip), notice: 'Gossip was successfully updated.' }
      		end
  		end
	end

	def create

		@gossip = Gossip.new(gossip_params)
		respond_to do |format|	
			if @gossip.save
				format.html { redirect_to gossip_path(@gossip), notice: 'Gossip was successfully updated.' }
			end
		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		if @gossip.present?
			@gossip.destroy
		respond_to do |format|
			format.html { redirect_to "/" , notice: 'Gossip has been destroyed!' }
			end
		end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    	def set_gossip
      		@gossip = Gossip.find(params[:id])
    	end

    # Never trust parameters from the scary internet, only allow the white list through.
    	def gossip_params
    		#je push le user id dans mon hash
      		temp_params = params.require(:gossip).permit(:anonymous_author, :content, :user_id)
      		temp_params.merge!(user_id: session[:user_id])
      		return temp_params
    	end
end
