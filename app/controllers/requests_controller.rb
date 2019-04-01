
class RequestsController < ApplicationController

  def index 

  if params[:order] == 'votes'
    @requests= Request.all.order(:cached_votes_up)
  elsif params[:order] == 'alphabetical'
    @requests = Request.all.order('title ASC')
  else
    @requests = Request.all.order(created_at: :desc)

  end 

  @request = Request.new
  end

  def show 
    @request= Request.find(params[:id])
    @comments = @request.comments.all
  end


  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to requests_url, notice: "Solicitud creada satisfactoriamente."
    else
      flash[:error] = @request.errors.full_messages.join(", ")
      redirect_to requests_url
    end
  end

  def like
    @request= Request.find(params[:id])
    @request.upvote_by(current_user)
    redirect_to requests_url
  end

  def unlike
    @request= Request.find(params[:id])
    @request.downvote_by(current_user)
    redirect_to :back
  end
  
  private

  def request_params
    params.require(:request).permit(:title, :content)
  end
end