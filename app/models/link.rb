class Link < ActiveRecord::Base
	before_save :generate_uuid, on: :create
	url_regex = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
	validates :given_url, presence: true, format: { with: url_regex }

	protected 

	def generate_uuid
		uuid = SecureRandom.uuid
		unique_id = uuid.split("-")
		self.uuid = unique_id.join("")

		generate_code(self.uuid)
	end

	def generate_code( id )
		self.code = Base64.urlsafe_encode64( id.to_s ).slice(0..6)
	end

end
