json.extract! event, :id, :name, :description, :eventtype, :eventrules, :eventgroup_id, :created_at, :updated_at
json.url event_url(event, format: :json)
