class Profile < ApplicationRecord
  belongs_to :user
  has_many :cv_generations, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :degrees, dependent: :destroy
  has_many :languages, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :phone_number, presence: true
  validates :email, presence: true
end
