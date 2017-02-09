Rails.application.config.middleware.use OmniAuth::Builder do
  provider :eventful, "EVENTFUL_KEY", "EVENTFUL_SECRET", 'APP_KEY'
end