class Notification < ApplicationRecord
  belongs_to :recipient
  enum notification_type: [:sms, :push, :email]
  enum status: [:pending, :sent, :failed]

  validates :message, presence: true
  validates :notification_type, presence: true

  after_create :enqueue_notification

  private

  def enqueue_notification
    NotificationJob.perform_later(self.id)
  end
end
