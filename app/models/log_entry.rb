class LogEntry < ActiveRecord::Base
  TYPES = %w[
    security
    gems
    exception
    note
  ].freeze

  belongs_to :repository

  scope :unpublished, -> { where report_id: nil }
  scope :published, -> { where 'report_id is not null' }

  store :data, {
    accessors: [
      :note,
    ],
    coder: JSON,
  }

  validates_presence_of :repository_id, :entry_type, :note

  before_save :default_completed_at
  after_save :update_repo_timestamp

  def client_name
    client.name if client
  end

  def repository_name
    repository.name if repository
  end

  def client
    repository.client if repository
  end

  def gems?
    entry_type == 'gems'
  end

  def exception?
    entry_type == 'exception'
  end

private

  def default_completed_at
    self.completed_at ||= Time.current
  end

  def update_repo_timestamp
    repository.update_columns last_entry_at: completed_at
  end

end
