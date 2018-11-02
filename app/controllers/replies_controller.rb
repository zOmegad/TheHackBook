class RepliesController < ApplicationController

	before_action :set_reply, only: [:edit, :update, :destroy]

	def index
	end

	def new
		@gossip = Gossip.find(params[:gossip_id])
		@comment = Comment.find(params[:comment_id])
		@reply = Comment.find(params[:comment_id]).replies.new
	end

	def show
	end

	def edit
	end

	def delete
	end

	def update
	end

	def create
		@reply = Comment.find(params[:comment_id]).replies.new(reply_params)
		@reply.save
    	respond_to do |format|
        	format.html { redirect_to gossip_path(params[:gossip_id])}	
    	end
	end
  private
    def reply_comment
      puts "J'affiche les params de SET"
      print params
      @comment = Comment.find(params[:id])
    end

    def reply_params
      @temparam = params.require(:reply).permit(:anonymous_replier, :content, :gossip_id)
      @temparam.merge!(user_id: session[:user_id])
      return @temparam
    end
end
