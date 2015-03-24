class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  validates :user_id, uniqueness: {scope: :response_id}

end
