class Tally < ApplicationRecord
  belongs_to :candidate
  belongs_to :counting_station
  belongs_to :election_period
  belongs_to :electoral_position
end
