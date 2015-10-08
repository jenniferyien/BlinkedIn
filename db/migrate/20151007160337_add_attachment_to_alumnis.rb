class AddAttachmentToAlumnis < ActiveRecord::Migration
  def change
    add_column :alumnis, :attachment, :string
  end
end
