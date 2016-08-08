json.extract! user, :id, :name, :last_name, :type_identification_id, :identification, :user_name, :password_digest, :email, :estate_id, :created_at, :updated_at
json.url user_url(user, format: :json)