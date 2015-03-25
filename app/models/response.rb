class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  validates :body, presence: true

  def vote_count
    self.votes.count
  end

end
