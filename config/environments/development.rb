Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Host config for actionmailer
  config.action_mailer.default_url_options = { :host => "localhost",
                                               :port => "3000"}
  # Serves assets for emails (e.g images)
  config.action_mailer.asset_host = 'http://localhost:3000'

  # The following configuration is totally bogus, do not remove though it serves to
  # have mailer preview work
  # config.action_mailer.preview_path = "#{Rails.root}/test/mailers/previews"
  # to access mailers previews go to: 
  # http://localhost:3000/rails/mailers

  # Remote forms may omit the embedded authenticity token
  # and it may cause errors in Safari mobile, so I force the token to be present
  # http://apidock.com/rails/v3.2.8/ActionView/Helpers/FormTagHelper/form_tag
  # http://stackoverflow.com/questions/19452853/actioncontrollerinvalidauthenticitytoken-when-disable-js-ajax-request
  config.action_view.embed_authenticity_token_in_remote_forms = true

end
