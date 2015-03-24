class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  belongs_to :best_response, class_name: 'Response'
  validates :title, presence: true
  validates :body, presence: true
end
