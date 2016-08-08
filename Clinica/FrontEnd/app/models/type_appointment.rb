class TypeAppointment
	include ActiveModel::Model

	attr_accessor :id, :codigo, :description, :priority, :created_at, :updated_at, :url

	TOKEN = '4a11cea8-f1ba-422f-92c3-040f9b9f4404'

	def persisted?
		self.id.present?
	end

	def self.all
		response = HTTParty.get('http://localhost:3000/type_appointments.json', headers: {"token" => TOKEN})
		response.parsed_response.map do |type_identifications|
			new(type_identifications)
		end
	end

	def self.find(id)
		response = HTTParty.get("http://localhost:3000/type_appointments/#{id}.json", headers: {"token" => TOKEN})
		new(response.parsed_response)
	end

	def update
		response = HTTParty.put("http://localhost:3000/type_appointments/#{self.id}.json", query: {type_appointment: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def destroy
		response = HTTParty.delete("http://localhost:3000/type_appointments/#{self.id}.json", headers: {"token" => TOKEN})
		response.parsed_response
	end

	def save
		response = HTTParty.post('http://localhost:3000/type_appointments.json', query: {type_appointment: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def attributes
		{
			codigo: self.codigo,
			description: self.description,
			priority: self.priority
		}
	end
end