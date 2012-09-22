class GasStation < ActiveRecord::Base
  has_many :tanking_logs

  attr_accessible :name

  validates_presence_of :name
end
