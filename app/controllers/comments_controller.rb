class CommentsController < ApplicationController

	def create
    @request = Request.find(params[:request_id])
    @comment = @request.comments.create(params[:comment].permit(:content))
		redirect_to request_path(@request)	
	end

	def destroy
		
	end
end
