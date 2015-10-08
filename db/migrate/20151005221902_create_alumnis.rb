class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.references :user, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.text :about
      t.text :q1
      t.text :q2
      t.text :q3
      t.string :position
      t.integer :view, default: 0
      t.text :fun_fact

      t.timestamps null: false
    end
  end
end
