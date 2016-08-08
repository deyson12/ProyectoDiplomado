class User
	include ActiveModel::Model

	attr_accessor :id, :name, :last_name, :type_identification_id, :identification, :user_name, :password_digest, :email, :estate_id, :created_at, :updated_at, :url

	TOKEN = '4a11cea8-f1ba-422f-92c3-040f9b9f4404'

	def persisted?
		self.id.present?
	end

	def self.all
		response = HTTParty.get('http://localhost:3000/users.json', headers: {"token" => TOKEN})
		response.parsed_response.map do |doctor|
			new(doctor)
		end
	end

	def self.find(id)
		response = HTTParty.get("http://localhost:3000/users/#{id}.json", headers: {"token" => TOKEN})
		new(response.parsed_response)
	end

	def update
		response = HTTParty.put("http://localhost:3000/users/#{self.id}.json", query: {user: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def destroy
		response = HTTParty.delete("http://localhost:3000/users/#{self.id}.json", headers: {"token" => TOKEN})
		response.parsed_response
	end

	def save
		p attributes
		response = HTTParty.post('http://localhost:3000/users.json', query: {user: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def attributes
		{
			name: self.name,
			last_name: self.last_name,
			type_identification_id: self.type_identification_id,
			identification: self.identification,
			password_digest: self.password_digest,
			email: self.email,
			estate_id: self.estate_id
		}
	end
end