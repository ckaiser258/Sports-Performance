class Program < ApplicationRecord
  belongs_to :coach
  has_many :athletes
end
