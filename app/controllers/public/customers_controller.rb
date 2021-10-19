class Public::CustomersController < ApplicationController
  def show
    @public = current_public
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def public_params
    params.require(:public).params(:last_name, :first_name, :last_kana_name, :first_kana_name, :address, :postalcode, :telephone)
  end
end