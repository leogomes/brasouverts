# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_brasouverts_session',
  :secret      => '72c2bd295b7b3539288e6f321fe4748cb31fa4ff4082bb5d8a71b47a850d69582a094c146c1c10469f92c408c80143512c2c0ee8bcef1426ee8d5a18f0380ab1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
