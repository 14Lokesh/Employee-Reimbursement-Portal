# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, Rails.application.credentials.development[:google_client_id],
#            Rails.application.credentials.development[:google_client_secret]
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  # {
  #   redirect_uri: "https://1a73-2409-40e0-5b-158a-83bd-cb4f-f526-a88c.ngrok-free.app/auth/google_oauth2/callback"
  # }
end
