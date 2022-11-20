class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :description
      t.string :wiki_link
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
