class Client < ActiveRecord::Base
  has_many :reports
  has_many :repositories

  validates_presence_of :name
end
