json.extract! newsfile, :id, :title, :description, :created_at, :updated_at
json.url newsfile_url(newsfile, format: :json)
