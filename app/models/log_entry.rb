class LogEntry < ActiveRecord::Base
  TYPES = %w[
    gem
    exception
    note
  ].freeze

  belongs_to :application
  has_one :client, through: :application

  scope :unpublished, -> { where published: false }

  store :data, {
    accessors: [
      :note,
    ],
    coder: JSON,
  }

  validates_presence_of :application_id, :entry_type, :note

end
