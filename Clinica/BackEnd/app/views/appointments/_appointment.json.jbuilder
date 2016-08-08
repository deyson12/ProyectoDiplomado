json.extract! appointment, :id, :type_appointment_id, :description, :user_id, :doctor_id, :estate_id, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)