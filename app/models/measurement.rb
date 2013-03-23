class Measurement < ActiveRecord::Base
  belongs_to :instrument
  attr_accessible :unit, :value, :timestamp
end
