class AddressesController < ApplicationController

  before_action :set_address, only: [ :edit, :update, :destroy ]

  def index
    @addresses = Address.without_deleted.page(params[:page])
  end

  def new
    @address = Address.new
  end

  def create
    address = Address.find_or_create_by(ip_param)
    address.update!(addresses_params)
    address.deleted = false
    address.save
    redirect_to addresses_path
  end

  def edit
  end

  def update
    @address.update!(addresses_params)
    redirect_to addresses_path
  end

  def destroy
    @address.deleted = true
    @address.save
    redirect_to addresses_path
  end

  private

  def ip_param
    params.require(:address).permit( :ip )
  end

  def addresses_params
    params.require(:address).permit( :name, :ip, :switched )
  end

  def set_address
    @address = Address.find(params[:id])
  end

end
