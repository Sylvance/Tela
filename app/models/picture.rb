class Picture < ApplicationRecord
    has_many :electoral_position
    has_many :election_period
    has_many :candidate
    has_many :counting_station
end
