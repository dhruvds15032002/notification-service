class NotificationJob < ApplicationJob
  queue_as :default

  def perform(notification_id)
    notification = Notification.find_by(id: notification_id)
    return if notification.nil?

    case notification.notification_type
    when 'email'
      NotificationMailer.send_email(notification).deliver_now
    when 'sms'
      SmsService.send_sms(notification.recipient.phone, notification.message)
    when 'push'
      PushNotificationService.send_push(notification.recipient, notification.message)
    end

    notification.update(status: 'sent')
  rescue StandardError => e
    notification.update(status: 'failed', error_message: e&.message)
    Rails.logger.error("NotificationJob: #{e&.message}")
  end
end
