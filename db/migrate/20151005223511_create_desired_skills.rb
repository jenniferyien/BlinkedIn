class CreateDesiredSkills < ActiveRecord::Migration
  def change
    create_table :desired_skills do |t|
      t.references :employer, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
