class RenameType < ActiveRecord::Migration[7.1]
  def change
    rename_column :experiences, :type, :experience_type
  end
end
