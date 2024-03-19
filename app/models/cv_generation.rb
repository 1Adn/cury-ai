class CvGeneration < ApplicationRecord
  belongs_to :job_offer
  belongs_to :profile
  belongs_to :cv
end
