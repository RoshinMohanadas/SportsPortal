json.extract! team, :id, :name, :poc, :pocmobile, :pocemail, :arrivaldate, :arrivalloc, :modeofarrival, :arrivaldetails, :departuredate, :departureloc, :modeofdeparture, :departuredetails, :instructionsfromadmin, :event_id, :user_id, :created_at, :updated_at
json.url team_url(team, format: :json)
