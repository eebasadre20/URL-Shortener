class Link < ActiveRecord::Base
	before_save :generate_uuid, on: :create
	after_save :get_shorten, on: :create

	protected 

	def generate_uuid
		uuid = SecureRandom.uuid
		unique_id = uuid.split("-")
		self.uuid = unique_id.join("")

		generate_code(self.uuid)
	end

	def generate_code( id )
		self.code = 'http://localhost:3000/' + Base64.urlsafe_encode64( id.to_s ).slice(0..6)
	end

	def get_shorten
		Link.last
	end
end
