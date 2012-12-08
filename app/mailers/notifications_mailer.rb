class NotificationsMailer < ActionMailer::Base

  default :from => "flutracker@ymail.com"
  default :to => "flutracker@ymail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[FluTracker] #{message.subject}")
  end

end