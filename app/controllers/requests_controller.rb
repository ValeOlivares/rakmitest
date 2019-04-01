
class RequestsController < ApplicationController

  def index 
    @requests = Request.all.order(created_at: :desc)
    @request = Request.new
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
  
  private

  def request_params
    params.require(:request).permit(:title, :content)
  end
end