json.extract! event_group, :id, :name, :description, :reg_start_date, :reg_end_date, :start_date, :end_date, :is_active, :venue, :created_at, :updated_at
json.url event_group_url(event_group, format: :json)
