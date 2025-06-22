Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_OAuth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: 'email,profile',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50,
    access_type: 'offline'
  }
end
