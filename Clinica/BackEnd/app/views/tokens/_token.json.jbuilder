json.extract! token, :id, :token, :number_of_request, :name, :estate_id, :created_at, :updated_at
json.url token_url(token, format: :json)