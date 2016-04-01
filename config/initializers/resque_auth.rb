if Rails.env.production?
  Resque::Server.use(Rack::Auth::Basic) do |user, password|
    password == Rails.application.secrets.resque_password
  end
end
