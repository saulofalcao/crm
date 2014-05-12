# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  nome            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	validates :nome, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	before_save { self.email = email.downcase }

	before_create :create_remember_token

	validates :password, length: {minimum: 6 }

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end


	private
		def create_remember_token
			#cria o token
			self.remember_token = User.hash(User.new_remember_token)
		end

end
