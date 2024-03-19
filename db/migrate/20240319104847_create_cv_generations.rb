class CreateCvGenerations < ActiveRecord::Migration[7.1]
  def change
    create_table :cv_generations do |t|
      t.text :template
      t.references :job_offer, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
