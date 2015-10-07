class AddAvatarToAlumnis < ActiveRecord::Migration
  def change
    add_column :alumnis, :avatar, :string
  end
end
