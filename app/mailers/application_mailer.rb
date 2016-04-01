# encoding: UTF-8
require 'mail'

class ApplicationMailer < ActionMailer::Base

  # Send emails asyncronously
  include Resque::Mailer

  # This is for automatic inline styling
  include Roadie::Rails::Automatic


end
