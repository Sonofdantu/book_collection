json.extract! attendance, :id, :email, :event_name, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
