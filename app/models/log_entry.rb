class LogEntry < ActiveRecord::Base
  TYPES = %w[
    security
    gems
    exception
    note
  ].freeze

  belongs_to :application

  scope :unpublished, -> { where published: false }

  store :data, {
    accessors: [
      :note,
    ],
    coder: JSON,
  }

  validates_presence_of :application_id, :entry_type, :note

  before_save :default_completed_at

  def client_name
    client.name if client
  end

  def application_name
    application.name if application
  end

  def client
    application.client if application
  end

private

  def default_completed_at
    self.completed_at ||= Time.current
  end

end
