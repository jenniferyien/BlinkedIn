class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :alumni, index: true, foreign_key: true
      t.string :name
      t.string :url
      t.text :description

      t.timestamps null: false
    end
  end
end
