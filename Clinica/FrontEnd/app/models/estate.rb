class Estate
	include ActiveModel::Model

	attr_accessor :id, :name, :description, :created_at, :updated_at, :url

	TOKEN = '4a11cea8-f1ba-422f-92c3-040f9b9f4404'

	def persisted?
		self.id.present?
	end

	def self.all
		response = HTTParty.get('http://localhost:3000/estates.json', headers: {"token" => TOKEN})
		response.parsed_response.map do |estate|
			new(estate)
		end
	end

	def self.find(id)
		response = HTTParty.get("http://localhost:3000/estates/#{id}.json", headers: {"token" => TOKEN})
		new(response.parsed_response)
	end

	def update
		response = HTTParty.put("http://localhost:3000/estates/#{self.id}.json", query: {estate: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def destroy
		response = HTTParty.delete("http://localhost:3000/estates/#{self.id}.json", headers: {"token" => TOKEN})
		response.parsed_response
	end

	def save
		response = HTTParty.post('http://localhost:3000/estates.json', query: {estate: attributes}, headers: {"token" => TOKEN})
		response.parsed_response
	end

	def attributes
		{
			name: self.name,
			description: self.description
		}
	end
end