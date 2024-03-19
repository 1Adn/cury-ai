class Cv < ApplicationRecord
  belongs_to :user
  has_one :cv_generation
end
