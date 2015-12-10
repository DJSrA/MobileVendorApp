class Vendor < ActiveRecord::Base

  belongs_to :vendors
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
