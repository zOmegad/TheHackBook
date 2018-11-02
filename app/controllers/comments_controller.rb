class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    puts "L'ID EST"
    print params[:gossip_id]
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Gossip.find(params[:gossip_id]).comments.new
  end

  def edit
  	@gossip = Gossip.find(params[:gossip_id])
  end

  def create
    puts "JE RENTRE BIEN DANS CREATE"
    print params
    puts params[:gossip_id]
    print Gossip.find(params[:gossip_id]).comments.new(comment_params)
    @comment = Gossip.find(params[:gossip_id]).comments.new(comment_params)
    puts "VOILA"

    respond_to do |format|
      if @comment.save
        puts "JE SAUVEGARDE"
        format.html { redirect_to gossip_path(params[:gossip_id]) }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to gossip_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to gossip_path }
      end
    end
  end

  private
    def set_comment
      puts "J'affiche les params de SET"
      print params
      @comment = Comment.find(params[:id])
    end

    def comment_params
      @temparam = params.require(:comment).permit(:anonymous_commentor, :content,)
      @temparam.merge!(user_id: session[:user_id])
      return @temparam
    end
end