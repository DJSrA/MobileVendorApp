class Vendor < ActiveRecord::Base
  # fuzzily_searchable :name

  belongs_to :vendors
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end

end
