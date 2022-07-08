class ReminderType < ApplicationRecord
    has_many :reminders
    validates :name,presence: true
end
