class Experience < ApplicationRecord
  belongs_to :profile
  validates :title, presence: true
  validates :type, inclusion: { in: [
    "Professional Experience",
    "Volunteer Experience",
    "Internships and Apprenticeships",
    "Temporary or Contract Work Experience",
    "Freelance Projects",
    "Research Experience",
    "Participation in Competitions or Contests",
    "Professional Training",
    "Association Experience",
    "International Experience"
  ] }
  validates :field, prensence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true
  validates :description, presence: true
end