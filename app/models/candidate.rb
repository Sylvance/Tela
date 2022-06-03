class Candidate < ApplicationRecord
  has_many :votes
  has_many :tallies

  belongs_to :picture
  belongs_to :election_period
  belongs_to :electoral_position

  def tally_position
    2 # Tally.find_by(candidate_id: id).position
  end

  def tally_total_count
    Tally.find_by(candidate_id: self.id)
  end
end
