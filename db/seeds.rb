# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

15.times do |i|
    link = "link"
    picture = Picture.new(link: link)
    picture.save

    name = "name"
    date = DateTime.current.to_date
    election_period = ElectionPeriod.new(picture_id: picture.id, name: name, date: date)
    election_period.save!

    name = "name"
    jurisdiction = "IEBC-00#{i}"
    electoral_position = ElectoralPosition.new(picture_id: picture.id, name: name, jurisdiction: jurisdiction)
    electoral_position.save!

    name = "name"
    location = ["Thika Primary", "Nairobi Primary", "Kiambu High", "Mombasa Uni"]
    counting_station = CountingStation.new(picture_id: picture.id, name: name, location: location)
    counting_station.save!

    serial_no = "VOTE-SERIAL-NO-#{i}"
    ballot_type = ["Presidential", "Governor", "MCA", "Senator", "MP"].shuffle.first
    valid_vote = [true, false].shuffle.first

    name = "name"
    iebc_id = "IEBC-00#{i}"
    candidate = Candidate.new(
        picture_id: picture.id,
        name: name, iebc_id: iebc_id,
        election_period_id: election_period.id,
        electoral_position_id: electoral_position.id
    )
    candidate.save!

    vote = Vote.new(
        election_period_id: election_period.id,
        picture_id: picture.id,
        serial_no: serial_no,
        counting_station_id: counting_station.id,
        candidate_id: candidate.id,
        ballot_type: ballot_type,
        valid_vote: valid_vote,
        electoral_position_id: electoral_position.id
    )
    vote.save!
end
