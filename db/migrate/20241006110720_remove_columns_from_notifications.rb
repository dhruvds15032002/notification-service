class RemoveColumnsFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :user_id, :integer
    remove_column :notifications, :recipient_type, :string
    remove_column :notifications, :recipient_id, :integer
  end
end
