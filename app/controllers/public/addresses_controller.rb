class Public::AddressesController < ApplicationController
  before_action :move_to_signed_in

  def index
    @public = current_public
    @addresses = @public.addresses
    @address = Address.new
  end

  def edit
     @address = Address.find(params[:id])
     @public = current_public
  end

  def update
     @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "アドレス情報を更新しました！"
      redirect_to public_addresses_path
    else
      flash.now[:alert] = "情報を正しく入力してください！"
      render "edit"
    end
  end

  def create
    @address = Address.new(address_params)
    @address.public_id = current_public.id
    if @address.save
      flash[:notice] = "新しい宛先を作成しました！"
      redirect_to public_addresses_path
    else
      @addresses = current_public.addresses.all
      flash.now[:alert] = "情報を正しく入力してください！"
      render "index"
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.public_id == current_public.id
      address.destroy
      flash[:notice] = "アドレスを削除しました！"
      redirect_to public_addresses_path
    else
      flash[:alert] = "削除に失敗しました！"
      redirect_to public_addresses_path
    end
  end

  private
  def move_to_signed_in
    unless public_signed_in?
      redirect_to new_public_session_path
    end
  end

  def address_params
    params.require(:address).permit(:postalcode, :address, :destination)
  end

end
