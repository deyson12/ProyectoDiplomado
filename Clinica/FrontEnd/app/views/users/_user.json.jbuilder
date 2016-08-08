json.extract! user, :id, :name, :last_name, :type_identifications, :identification, :user_name, :password_digest, :email, :estate, :created_at, :updated_at
json.url user_url(user, format: :json)