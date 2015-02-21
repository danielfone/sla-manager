class Report < ActiveRecord::Base
  belongs_to :client
  belongs_to :repository

  has_many :log_entries

  validates_presence_of :repository, unless: :repository_id
  validates_presence_of :report_date

  before_save :set_client_id
  before_save :generate_token

  def to_param
    token
  end

  def client_reports
    client.reports if client
  end

  def month
    report_date.beginning_of_month
  end

  def client_name
    client.name if client
  end

  def repository_name
    repository.name if repository
  end

  def gem_details
    log_entries.select(&:gems?).map(&:note).join("\n")
  end

  def exceptions
    log_entries.select(&:exception?)
  end

  def security_entries
    log_entries.select(&:security?)
  end

  def notes
    log_entries.select(&:note?)
  end

  def private_notes
    log_entries.select(&:private_note?)
  end

private

  def generate_token
    self.token ||= SecureRandom.uuid
  end

  def set_client_id
    self.client_id ||= repository.client_id
  end

end
