class NotificationMailer < ApplicationMailer
  def send_email(notification)
    @message = notification.message
    mail(to: notification.recipient.email, subject: 'New Notification')
  end
end
