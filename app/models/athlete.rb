class Athlete < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  # validates :coach_id, length: { minimum: 1 },allow_nil: true
  # validates :program_id, length: { minimum: 1 },allow_nil: true

  belongs_to :coach, optional: true
  belongs_to :program, optional: true
  has_many :athlete_sports
  has_many :sports, through: :athlete_sports
end
