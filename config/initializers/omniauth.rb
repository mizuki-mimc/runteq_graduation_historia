OmniAuth.config.allowed_request_methods = [ :get, :post ]

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    scope: "email,profile",
    prompt: "select_account",
    image_aspect_ratio: "square",
    image_size: 50,
    access_type: "offline",
    callback_path: "/auth/google_oauth2/callback"
  }
end
