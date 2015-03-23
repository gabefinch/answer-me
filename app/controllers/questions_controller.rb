class QuestionsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    if @user == current_user
      @question = @user.questions.new(question_params)
      if @question.save
        flash[:notice] = "Question added!"
        redirect_to user_path(@user)
      else
        flash[:error] = "Question not added."
        render :new
      end
    else
      redirect_to users_path
    end
  end

private
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
