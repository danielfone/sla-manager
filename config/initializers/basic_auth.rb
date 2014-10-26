SlaManager::Application.configure do
  user, pass = String(ENV['BASIC_AUTH']).split(':')

  user && pass and config.basic_auth_credentials = {
    name: user,
    password: pass,
  }
end
