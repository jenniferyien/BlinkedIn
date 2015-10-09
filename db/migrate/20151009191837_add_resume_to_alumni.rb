class AddResumeToAlumni < ActiveRecord::Migration
  def change
    add_column :alumnis, :resume, :string
  end
end
