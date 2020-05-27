class Athlete < ApplicationRecord
  belongs_to :coach
  belongs_to :program
  has_many :athlete_sports
  has_many :sports, through: :athlete_sports
end
