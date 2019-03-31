OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '99704747938-j8bbd7ql51pg46jh5r8qjnqpom0ou2la.apps.googleusercontent.com', 'VE27CQC968i3gfm__k93lIbN', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end