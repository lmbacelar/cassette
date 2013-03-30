class Instrument < ActiveRecord::Base
  attr_accessible :name, :description
  validates :name, presence: true, uniqueness: true
  has_many :measurements

  def self.search search
    if search
      where 'name ILIKE ?', "%#{search}%"
    else
      scoped
    end
  end

  def to_s
    name
  end
end
