class AthleteSport < ApplicationRecord
  belongs_to :athlete
  belongs_to :sport
end
