json.extract! type_appointment, :id, :codigo, :description, :priority, :created_at, :updated_at
json.url type_appointment_url(type_appointment, format: :json)