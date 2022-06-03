class Candidate < ApplicationRecord
  def self.tally_position
    Tally.where(candidate_id: id).position
  end

  def self.tally_total_count
    Tally.where(candidate_id: id).total_count
  end
end
