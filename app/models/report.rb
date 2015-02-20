class Report < ActiveRecord::Base
  belongs_to :client
  belongs_to :repository

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

  def repository_name
    repository.name if repository
  end

private

  def generate_token
    self.token ||= SecureRandom.uuid
  end

end
