class Report < ActiveRecord::Base
  belongs_to :client

  before_save :generate_token

  def to_param
    token
  end

private

  def generate_token
    self.token ||= SecureRandom.uuid
  end

end
