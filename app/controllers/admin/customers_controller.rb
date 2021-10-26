class Admin::CustomersController < ApplicationController
  def index
    @publics = Public.all
    @publics = Public.page(params[:page]).per(6)
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
    params.require(:public).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :postal_code, :address, :telephone, :email, :user_status)
  end

end
