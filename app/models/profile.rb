class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :skills
  has_many :experiences
end
