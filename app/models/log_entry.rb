class LogEntry < ActiveRecord::Base
  TYPES = %w[
    security
    gems
    exception
    note
  ].freeze

  belongs_to :repository

  scope :unpublished, -> { where published: false }

  store :data, {
    accessors: [
      :note,
    ],
    coder: JSON,
  }

  validates_presence_of :repository_id, :entry_type, :note

  before_save :default_completed_at

  def client_name
    client.name if client
  end

  def repository_name
    repository.name if repository
  end

  def client
    repository.client if repository
  end

private

  def default_completed_at
    self.completed_at ||= Time.current
  end

end
