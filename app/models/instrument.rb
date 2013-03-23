class Instrument < ActiveRecord::Base
  attr_accessible :name, :description
  validates :name, presence: true, uniqueness: true
  has_many :measurements

  def to_s
    name
  end
end
