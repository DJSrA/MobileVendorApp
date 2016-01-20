class Vendor < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  # fuzzily_searchable :name
  acts_as_likeable
  belongs_to :vendors
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end

  # def self.search(query)
  #   # where(:title, query) -> This would return an exact match of the query
  #   where("name like ?", "%#{query}%") 
  # end

end
