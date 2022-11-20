class CreateNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :city_id
      t.text :description
      t.string :wiki_link
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
