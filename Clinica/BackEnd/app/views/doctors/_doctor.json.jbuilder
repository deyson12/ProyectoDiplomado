json.extract! doctor, :id, :name, :last_name, :level_doctor_id, :estate_id, :admission_date, :clinic_id, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)