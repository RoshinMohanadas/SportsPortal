json.extract! announcement, :id, :message, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
