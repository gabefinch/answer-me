class ResponsesController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @user = @question.user
    @response = Response.new
  end

  def create
    @response = current_user.responses.new(response_params)
    @response.question_id = params[:question_id]
    if @response.save
      flash[:notice] = "Response added!"
      redirect_to user_question_path(params[:user_id], params[:question_id])
    else
      flash[:error] = "Failure."
      render :new
    end
  end

  private
    def response_params
      params.require(:response).permit(:body)
    end

end
