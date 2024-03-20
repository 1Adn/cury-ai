class JobOffer < ApplicationRecord
  belongs_to :user
  has_many :cv_generations

  validates :title, presence: true
  validates :description, presence: true
end
