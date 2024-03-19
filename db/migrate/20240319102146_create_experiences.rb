class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :type
      t.string :field
      t.date :starting_date
      t.date :ending_date
      t.text :description
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
