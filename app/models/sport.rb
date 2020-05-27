class Sport < ApplicationRecord
    has_many :athletesports
    has_many :athletes, through :athletesports
end
