class Public::CustomersController < ApplicationController
  def show
    @public = current_public
    @public = Public.find(params[:id])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    public = Public.find(params[:id])
    public.update(public_params)
    redirect_to public_customer_path(public.id)
  end

  def unsubscribe
    @public = Public.find(params[:id])
<<<<<<< HEAD
=======
    redirect_to public_confirm_unsubscribe
>>>>>>> c51b8d9e4c04a7c4112def98897c10046662c564
  end

  def withdraw
    @public = Public.find(params[:id])
<<<<<<< HEAD
    @public.update(user_status: true)
=======
    @public.update(is_valid: false)
>>>>>>> c51b8d9e4c04a7c4112def98897c10046662c564
    reset_session
    redirect_to root_path
  end

  private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :email, :address, :postalcode, :telephone)
  end
end