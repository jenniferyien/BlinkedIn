class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :company_name
      t.string :website
      t.string :company_type
      t.text :description

      t.timestamps null: false
    end
  end
end