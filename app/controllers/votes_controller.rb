class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    vote.user = current_user
    vote.save
    redirect_to question_path(vote.response.question)
    # alternate method:
    # response = Response.find(vote_params[:response_id])
    # Vote.create(user_id: user.id, response_id: response.id)
    # redirect_to question_path(response.question)
  end
private
  def vote_params
    params.require(:vote).permit(:response_id)
  end

end
