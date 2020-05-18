class CatRentalRequestsController < ApplicationController
  def new
    @rental = CatRentalRequest.new
    render :new
  end

  def create
    @rental = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(@rental.cat)
    else
      flash.now[:errors] = @rental.errors.full_messages
      render :new
    end
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :end_date, :start_dat, :status)
  end
end