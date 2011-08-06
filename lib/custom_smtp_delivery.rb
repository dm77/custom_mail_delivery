require 'mail'
class CustomSmtpDelivery < Mail::SMTP
  def initialize(values)
    self.settings = {:address => "smtp.gmail.com",
                     :port => 587,
                     :domain => 'localhost',
                     :user_name => "username",
                     :password => "password",
                     :authentication => 'plain',
                     :enable_starttls_auto => true,
                     :openssl_verify_mode => nil
                    }.merge!(values)
  end
  attr_accessor :settings

  def deliver!(mail)
    # Redirect all email to a specific email
    mail['to'] = "catchall@domain.com"
    mail['bcc'] = []
    mail['cc'] = []
    super(mail)
  end
end


