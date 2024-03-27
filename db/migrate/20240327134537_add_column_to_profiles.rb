class AddColumnToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :photo, :string
  end
end
