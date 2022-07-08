class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :content
      t.integer :reminder_type_id
      t.datetime :expire_at
      t.integer :status
      t.timestamps
    end
  end
end
