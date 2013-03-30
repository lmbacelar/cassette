class Instrument < ActiveRecord::Base
  attr_accessible :name, :description
  validates :name, presence: true, uniqueness: true
  has_many :measurements

  include PgSearch
  pg_search_scope :search, against: [:name, :description],
    using: {tsearch: {prefix: true, dictionary: "english"}},
    ignoring: :accents

  def self.text_search query
    if query.present?
      search query
    else
      scoped
    end
  end

  def to_s
    name
  end
end
