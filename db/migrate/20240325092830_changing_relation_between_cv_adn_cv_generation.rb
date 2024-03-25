class ChangingRelationBetweenCvAdnCvGeneration < ActiveRecord::Migration[7.1]
  def change
    remove_column :cv_generations, :cv_id
    add_reference :cvs, :cv_generation, null: false, foreign_key: true
  end
end
