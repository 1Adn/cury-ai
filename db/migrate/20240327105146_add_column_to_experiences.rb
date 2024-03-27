class AddColumnToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :company, :string
  end
end
