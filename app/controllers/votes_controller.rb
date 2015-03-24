class VotesController < ApplicationController

  def create
    user = current_user
    response = Response.find(vote_params[:response_id])
    Vote.create(user_id: user.id, response_id: response.id)
    redirect_to question_path(response.question)
  end
private
  def vote_params
    params.require(:vote).permit(:response_id)
  end

end
