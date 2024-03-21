class Degree < ApplicationRecord
  belongs_to :profile
  validates :title, presence: true
  validates :level, presence: true
  validates :level, inclusion: { in: ["Bac", "Bac +2", "Bac +3", "Bac +5", "Doctora"] }
  validates :field, presence: true
  validates :school, presence: true
end
