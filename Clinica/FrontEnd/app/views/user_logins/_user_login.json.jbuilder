json.extract! user_login, :id, :name, :last_name, :user_name, :email, :password_digest, :birth_date, :estatus, :avatar_url, :phone, :identification, :created_at, :updated_at
json.url user_login_url(user_login, format: :json)