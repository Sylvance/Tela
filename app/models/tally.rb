class Tally < ApplicationRecord
  belongs_to :candidate
  belongs_to :counting_station
end
