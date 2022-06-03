class CountingStation < ApplicationRecord
    has_many :votes
    has_many :tallies

    belongs_to :picture

    def self.tally_position
      Tally.where(counting_station_id: id).position
    end

    def self.tally_total_count
      Tally.where(counting_station_id: id).total_count
    end
end
