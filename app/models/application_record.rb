class ApplicationRecord < ActiveRecord::Base
  enum status: [:active, :archieved, :expired]
  primary_abstract_class
end
