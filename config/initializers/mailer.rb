class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = ENV["MAIL_INTERCEPTOR_EMAIL"] || "cristian.brotto@gmail.com"
  end
end

if Rails.env.development?

  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "",
    :user_name => "",
    :password => "",
    :authentication => "plain",
    :enable_starttls_auto => true
  }
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)

elsif Rails.env.production?

  if ENV["USE_AS_MAIN_EMAIL_PROVIDER_SENDGRID"] == "true"

    ActionMailer::Base.smtp_settings = {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => '',
      :authentication => :plain,
      :user_name => '',
      :password => '',
      :enable_starttls_auto => true
    }

  else #fallback to Mandrill

    ActionMailer::Base.smtp_settings = {
      :address =>  'smtp.mandrillapp.com',
      :domain => '',
      :user_name => '',
      :password => '',
      :port => '587',
      :authentication => :plain,
      :enable_starttls_auto => true
    }

  end

end
