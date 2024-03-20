class Skill < ApplicationRecord
  belongs_to :profile, dependent: :destroy
  validates :title, presence: true
  validates :level, presence: true
  validates :level, inclusion: { in: ["Junior (0-2 years)", "Experimented (2-5 years)", "Senior (5+ years)"] }
end
