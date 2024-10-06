class AddErrorMessageToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :error_message, :text
  end
end
