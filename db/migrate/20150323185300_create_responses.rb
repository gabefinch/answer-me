class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
