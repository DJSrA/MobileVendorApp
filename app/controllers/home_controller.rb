class HomeController < ApplicationController
  autocomplete :vendor, :name

  def index
  #   if params[:term]
  #     @vendor = Vendor.find(:all,:conditions => ['given_name LIKE ?', "%#{params[:term]}%"])
  #   else
  #     @vendor = Vendor.all
  #   end

  #   respond_to do |format|  
  #     format.html # index.html.erb  
  # # Here is where you can specify how to handle the request for "/people.json"
  #     format.json { render :json => @vendor.to_json }
  #     end
  end


end
