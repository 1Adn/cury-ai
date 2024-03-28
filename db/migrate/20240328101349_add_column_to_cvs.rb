class AddColumnToCvs < ActiveRecord::Migration[7.1]
  def change
    add_column :cvs, :content, :text
  end
end
