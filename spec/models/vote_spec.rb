require 'rails_helper'

describe Vote do
  it { should belong_to :user }
  it { should belong_to :response }
  it { should validate_uniqueness_of(:user_id).scoped_to(:response_id) }
end
