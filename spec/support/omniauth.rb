OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  info: {
    first_name: 'Joe',
    last_name: 'Bloggs',
    email: "joe.bloggs@example.com"
    }
  })

Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
