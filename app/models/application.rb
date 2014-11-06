class Application < ActiveRecord::Base
  belongs_to :client
  has_many :log_entries

  validates_presence_of :name

  def client_name
    client.name if client
  end
end
