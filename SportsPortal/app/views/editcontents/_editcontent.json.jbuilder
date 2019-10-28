json.extract! editcontent, :id, :welcometext, :about, :facilities, :contact, :created_at, :updated_at
json.url editcontent_url(editcontent, format: :json)
