class RepliesController < ApplicationController

	def new

	@gossip = Gossip.find(params[:gossip_id], params[:comment_id])
    @reply = Gossip.find(params[:gossip_id]).replies.new
    
	end

	def show
	end

	def edit
	end

	def delete
	end

	def update
	end

end
