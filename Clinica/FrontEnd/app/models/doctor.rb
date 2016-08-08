class Doctor
	include ActiveModel::Model

	attr_accessor :id, :name, :last_name, :level_doctor_id, :estate_id, :admission_date, :clinic_id, :created_at, :updated_at, :url

	TOKEN = '4a11cea8-f1ba-422f-92c3-040f9b9f4404'

	def persisted?
		self.id.present?
	end

	def self.all
		response = HTTParty.get('http://localhost:3000/doctors.json', headers: {"token" => TOKEN})
		response.parsed_response.map do |doctor|
			new(doctor)
		end
	end

	def self.find(id)
		response = HTTParty.get("http://localhost:3000/doctors/#{id}.json", headers: {"token" => TOKEN})
		new(response.parsed_response)
	end

	def update
		response = HTTParty.put("http://localhost:3000/doctors/#{self.id}.json", query: {doctor: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def destroy
		response = HTTParty.delete("http://localhost:3000/doctors/#{self.id}.json", headers: {"token" => TOKEN})
		response.parsed_response
	end

	def save
		response = HTTParty.post('http://localhost:3000/doctors.json', query: {doctor: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def attributes
		{
			name: self.name,
			last_name: self.last_name,
			level_doctor_id: self.level_doctor_id,
			estate_id: self.estate_id,
			admission_date: self.admission_date,
			clinic_id: self.clinic_id
		}
	end
end