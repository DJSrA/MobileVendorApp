module HomeHelper
  def getVendor
    @vendor = Vendor.where(:name => params[:vendor_name]).first
  end
end
