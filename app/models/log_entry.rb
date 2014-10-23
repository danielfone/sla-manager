class LogEntry < ActiveRecord::Base
  belongs_to :application

  scope :unpublished, -> { where published: false }
end
