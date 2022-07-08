class Reminder < ApplicationRecord
    validates :title, :content, :expire_at, :status, :reminder_type_id,presence: true
    validates :status, inclusion: { in: %w(active archieved expired),message: "%{value} is not valid"}
    belongs_to :reminder_type
end
