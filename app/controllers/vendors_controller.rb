class VendorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    # @user = current_user
    @vendors = Vendor.order('updated_at desc')
    # @vendor = Vendor.find(params[:id])
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
        # current_user.vendors << @vendor
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
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @news_item.update(news_item_params)
  #       format.html { redirect_to @news_item, notice: 'news_item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @news_item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @news_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
      params.require(:vendor).permit(:name, :description, :url)
    end
end
