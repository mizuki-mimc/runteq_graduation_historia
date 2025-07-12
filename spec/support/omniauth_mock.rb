RSpec.configure do |config|
  config.before(:each, type: :system) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456789',
      info: {
        name: 'テストユーザー',
        email: 'test@example.com'
      }
    })
  end

  config.after(:each, type: :system) do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.test_mode = false
  end
end
