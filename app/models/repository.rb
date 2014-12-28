class Repository < ActiveRecord::Base
  belongs_to :client
  has_many :log_entries

  validates_presence_of :name

  def client_name
    client.name if client
  end

  def last_log_entry
    log_entries.order('completed_at').last
  end
end
