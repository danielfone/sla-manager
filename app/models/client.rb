class Client < ActiveRecord::Base
  has_many :reports
  has_many :repositories

  validates_presence_of :name

  before_create :generate_token

private

  def generate_token
    self.token ||= SecureRandom.uuid
  end
end
