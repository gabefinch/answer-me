class AddBestResponseToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :best_response_id, :integer
  end
end
