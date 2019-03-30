OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '989732062212-mt78p86h245vedpi3bpmdtbtmafd6fq5.apps.googleusercontent.com', 'c-hA-ygW-DuzWstBJV3EKFgE', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end