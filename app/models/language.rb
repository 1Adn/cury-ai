class Language < ApplicationRecord
  belongs_to :profile, dependent: :destroy
  validates :title, presence: true
  validates :level, presence: true
  validates :level, inclusion: { in: [
    "A1 (débutant absolu)",
    "A2 (élémentaire)",
    "B1 (intermédiaire)",
    "B2 (intermédiaire avancé)",
    "C1 (autonome)",
    "C2 (maîtrise complète)"
  ] }
end
