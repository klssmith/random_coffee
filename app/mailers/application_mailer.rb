class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_SENDER'] ||= "random-coffee@example.com"
  layout 'mailer'
end
