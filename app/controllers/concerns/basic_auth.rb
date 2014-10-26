module BasicAuth
  extend ActiveSupport::Concern

  included do
    http_basic_authenticate_with credentials if credentials.present?
  end

  module ClassMethods
    def credentials
      SlaManager::Application.config.basic_auth_credentials
    end
  end

end
