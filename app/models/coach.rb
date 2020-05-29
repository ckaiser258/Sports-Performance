class Coach < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :programs
    has_many :athletes
    has_many :coach_sports
    has_many :sports, through: :coach_sports
end
