SlaManager::Application.configure do
  user, pass = String(ENV['BASIC_AUTH']).split(':')

  config.basic_auth_credentials = if user && pass
    {
      name: user,
      password: pass,
    }
  else
    {}
  end
end
