class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  validates :body, presence: true
end
