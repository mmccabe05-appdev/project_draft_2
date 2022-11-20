class CreateReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :reasons do |t|
      t.integer :user_id
      t.string :description
      t.string :link
      t.integer :upvotes
      t.integer :downvotes
      t.integer :neighborhood_id_1
      t.integer :neighborhood_id_2

      t.timestamps
    end
  end
end
