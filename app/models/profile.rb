class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :photo
  has_many :skills
  has_many :experiences
  has_many :degrees
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :phone_number, presence: true
  validates :email, presence: true
end
