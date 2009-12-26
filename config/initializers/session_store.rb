# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bandwebsite_session',
  :secret      => 'f897226baa16d6bc8d8d42aef090c9065138a1db00422a788ed2e7d299e553ef88849d2236fe5d7ad314c035709c25fd6722e2ccdd8d3a31265ac5921e98692c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
