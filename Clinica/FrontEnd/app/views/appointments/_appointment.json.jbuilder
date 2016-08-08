json.extract! appointment, :id, :type_appointment, :description, :user, :doctor, :estate, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)