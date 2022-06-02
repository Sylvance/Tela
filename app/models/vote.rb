class Vote < ApplicationRecord
  belongs_to :election_period
  belongs_to :picture
  belongs_to :counting_station
  belongs_to :candidate
  belongs_to :electoral_position
end
