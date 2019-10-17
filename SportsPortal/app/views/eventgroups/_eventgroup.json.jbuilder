json.extract! eventgroup, :id, :name, :description, :regstartdate, :regenddate, :startdate, :enddate, :isactive, :venue, :created_at, :updated_at
json.url eventgroup_url(eventgroup, format: :json)
