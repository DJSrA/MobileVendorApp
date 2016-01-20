class SocializationsController < ApplicationController
  before_filter :load_socializable

  def like
    current_user.like!(@socializable)
    # redirect_to :back
    respond_to do |format|
      format.html {redirect_to(:action => "index", :controller => "vendors")}
      format.js 
    end
  end

  def unlike
    current_user.unlike!(@socializable)
    # redirect_to :back
    respond_to do |format|
      format.html {redirect_to(:action => "index", :controller => "vendors")}
      format.js 
    end
  end

private
  def load_socializable
    @user = current_user
    @vendors = Vendor.all
    @socializable =
      case
      when id = params[:vendor_id]
        @vendors.find(id)
      else
        raise ArgumentError, "Unsupported socializable model, params: " +
                             params.keys.inspect
      end
    raise ActiveRecord::RecordNotFound unless @socializable
  end  
end