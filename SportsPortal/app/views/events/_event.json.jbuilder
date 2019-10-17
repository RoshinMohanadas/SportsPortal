json.extract! event, :id, :name, :description, :event_type, :event_rules, :EventGroup_id, :created_at, :updated_at
json.url event_url(event, format: :json)
