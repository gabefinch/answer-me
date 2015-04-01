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
      UserMailer.responded(@response).deliver
      redirect_to question_path(@response.question)
    else
      flash[:error] = "Failure."
      render :new
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    redirect_to :back
  end

  private
    def response_params
      params.require(:response).permit(:body)
    end

end
