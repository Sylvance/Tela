class ElectionPeriod < ApplicationRecord
    has_many :votes
    has_many :tallies

    belongs_to :picture

    def self.tally_position
      Tally.where(election_period_id: id).position
    end

    def self.tally_total_count
      Tally.where(election_period_id: id).total_count
    end
end
