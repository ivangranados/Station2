class Car < ActiveRecord::Base
  belongs_to :user
  has_many :tanking_logs

  attr_accessible :brand, :color, :model, :user_id, :year

  validates_presence_of :brand, :color , :model , :year
end
