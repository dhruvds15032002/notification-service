class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :recipient_type
      t.integer :recipient_id
      t.text :message
      t.integer :status
      t.integer :notification_type

      t.timestamps
    end
  end
end
