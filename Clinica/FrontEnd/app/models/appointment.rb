class Appointment
	include ActiveModel::Model

	attr_accessor :id, :type_appointment_id, :description, :user_id, :doctor_id, :estate_id, :date, :created_at, :updated_at, :url

	TOKEN = '4a11cea8-f1ba-422f-92c3-040f9b9f4404'

	def persisted?
		self.id.present?
	end

	def self.all
		response = HTTParty.get('http://localhost:3000/appointments.json', headers: {"token" => TOKEN})
		response.parsed_response.map do |type_identifications|
			new(type_identifications)
		end
	end

	def self.find(id)
		response = HTTParty.get("http://localhost:3000/appointments/#{id}.json", headers: {"token" => TOKEN})
		new(response.parsed_response)
	end

	def update
		response = HTTParty.put("http://localhost:3000/appointments/#{self.id}.json", query: {type_appointment: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def destroy
		response = HTTParty.delete("http://localhost:3000/appointments/#{self.id}.json", headers: {"token" => TOKEN})
		response.parsed_response
	end

	def save
		response = HTTParty.post('http://localhost:3000/appointments.json', query: {type_appointment: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def attributes
		{
			type_appointment_id: self.type_appointment_id,
			description: self.description,
			user_id: self.user_id,
			doctor_id: self.doctor_id,
			estate_id: self.estate_id,
			date: self.date
		}
	end
end