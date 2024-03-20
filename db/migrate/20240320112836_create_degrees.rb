class CreateDegrees < ActiveRecord::Migration[7.1]
  def change
    create_table :degrees do |t|
      t.string :title
      t.string :level
      t.string :field
      t.string :school
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
