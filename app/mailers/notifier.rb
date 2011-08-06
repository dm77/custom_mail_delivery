class Notifier < ActionMailer::Base
  def welcome
    mail(:to      => "receiver@somedomain.com",
         :from    => "sender@somedomain.com",
         :subject => "Test custom delivery",
         :body    => "Hello, World!")
  end
end
