class WigRentalsController < ApplicationController

  def new
    @wig = Wig.find(params[:wig_id])
    @wig_rental = WigRental.new
  end

  def create
    # raise
    @wig = Wig.find(params[:wig_id])
    @wig_rental = WigRental.new(wig_rental_params)
    @wig_rental.user = current_user
    @wig_rental.wig = @wig
    if @wig_rental.save
      redirect_to wig_path(@wig)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @my_rental = WigRental.find(params[:id])
    @wig = Wig.find(params[:wig_id])
  end

  def update
    @my_rental = WigRental.find(params[:id])
    if @my_rental.update(wig_rental_params)
      redirect_to myrentals_path, notice: 'rental was successfully updated.'

    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @my_rental = WigRental.find(params[:id])
    @my_rental.destroy
    redirect_to myrentals_path, notice: 'rental was successfully removed.'
  end

  def myrentals
    @rentals = WigRental.where(user_id: current_user)
  end

  private

  def wig_rental_params
    params.require(:wig_rental).permit(:user_id, :rental_start, :rental_end, :wig_id)
  end
end
