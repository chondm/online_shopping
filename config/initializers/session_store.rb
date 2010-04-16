# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_online_shopping_session',
  :secret      => 'd4d14a145e89c3453004faefb610e752f3250b7c7d598bf83cd41e87b4605b92f9c1632e2d55930110a4b880e9e3d2e22a617afc93eeee81f50c258ecf2f4c09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
