json.extract! vote, :id, :election_period_id, :picture_id, :serial_no, :counting_station_id, :candidate_id, :ballot_type, :valid_vote, :electoral_position_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
