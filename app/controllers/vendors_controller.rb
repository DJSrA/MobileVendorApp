class VendorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    # @user = current_user
    date = DateTime.now
    @testVendors = Vendor.order('updated_at desc')
    @vendors = Vendor.where("date_open != ?", Date.current)
    # @openVendors = Vendor.where(date_open: Date.today)
    @openVendors = Vendor.where("date_open == ?", Date.current )
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    # @vendor = Vendor.new(vendor_params)
    @user = current_user
    @vendor = @user.vendors.build(vendor_params)
    puts "vendor #{@vendor.inspect}"
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to vendors_path, notice: 'vendor was successfully created.' }
        # format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @vendor = Vendor.find(params[:id])
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to vendors_path, notice: 'vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        puts "You failed"
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_path, notice: 'vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:name, :description, :url, :approved, :latitude, :longitude, :address, :open_time, :close_time, :date_open)
    end
end
