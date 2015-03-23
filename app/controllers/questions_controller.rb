class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    if current_user != nil
      @question = Question.new(question_params)
      @question.user_id = current_user.id
      if @question.save
        flash[:notice] = "Question added!"
        redirect_to user_path(current_user)
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
