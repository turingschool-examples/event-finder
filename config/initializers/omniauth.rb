Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :eventful, ENV['EVENTFUL_KEY'], ENV['EVENTFUL_SECRET']
end
