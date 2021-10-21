class Admin::CustomersController < ApplicationController
  def index
    @publics = Public.all
  end

  def show
    @public = Public.find(params[:id])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    if @public.update(public_params)
      redirect_to admin_customer_path(@public)
    else
      render 'edit'
    end
  end
  
  private
  
  def public_params
    params.require(:public).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :address, :postalcode, :telephone, :email, :sale_status)
  end
end
