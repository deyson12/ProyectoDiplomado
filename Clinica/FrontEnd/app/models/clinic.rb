class Clinic
	include ActiveModel::Model

	attr_accessor :id, :name, :address, :created_at, :updated_at, :url

	TOKEN = '4a11cea8-f1ba-422f-92c3-040f9b9f4404'

	def persisted?
		self.id.present?
	end

	def self.all
		response = HTTParty.get('http://localhost:3000/clinics.json', headers: {"token" => TOKEN})
		response.parsed_response.map do |estate|
			new(estate)
		end
	end

	def self.find(id)
		response = HTTParty.get("http://localhost:3000/clinics/#{id}.json", headers: {"token" => TOKEN})
		new(response.parsed_response)
	end

	def update
		response = HTTParty.put("http://localhost:3000/clinics/#{self.id}.json", query: {clinic: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def destroy
		response = HTTParty.delete("http://localhost:3000/clinics/#{self.id}.json", headers: {"token" => TOKEN})
		response.parsed_response
	end

	def save
		response = HTTParty.post('http://localhost:3000/clinics.json', query: {clinic: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def attributes
		{
			name: self.name,
			address: self.address
		}
	end
end