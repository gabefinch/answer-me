require 'rails_helper'

describe Response do
  it { should validate_presence_of :body }
  it { should belong_to :user }
  it { should belong_to :question }
  it { should have_many :votes }
end
