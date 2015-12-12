class Vendor < ActiveRecord::Base

  belongs_to :vendors
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  
  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end

end
