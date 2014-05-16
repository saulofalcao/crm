# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#ControleDeEstoque::Application.config.secret_key_base = 'f74777b26b0d04a0b62cdfa43a2f1061395a6542c5099650a5b1ca1766dcd4a90d6e8e122e37bbe51dad8ce417f50b054529d6268391553adecb227833af0926'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
ControleDeEstoque::Application.config.secret_key_base = secure_token 
