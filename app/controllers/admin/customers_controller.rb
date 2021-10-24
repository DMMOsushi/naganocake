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
<<<<<<< HEAD
  end
  
  private
  
  def public_params
    params.require(:public).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :address, :postalcode, :telephone, :email, :sale_status)
=======
>>>>>>> d736c73aaa7a4e0eb36b4f2fab2120d53029600f
  end
  
  private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :postal_code, :address, :telephone, :email, :user_status)
  end

end
