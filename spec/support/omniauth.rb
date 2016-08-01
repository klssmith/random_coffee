OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  info: {
    first_name: 'Trial',
    last_name: 'User',
    email: 'trial.user@example.com',
    image: 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg'}
  })

Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
