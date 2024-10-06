class AddRecipientToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :recipient, foreign_key: true
  end
end
