class WigsController < ApplicationController
  before_action :set_wig, only: %i[show edit update destroy]

  def index
    @wigs = Wig.all
  end

  def show
    @current_user = current_user
    @wig_rentals = WigRental.all
    @wig_rental = WigRental.where(wig_id: params[:id]).first
  end

  def new
    @wig = Wig.new
  end

  def create
    @wig = Wig.new(wig_params)
    @wig.owner = current_user
    if @wig.save
      redirect_to wigs_path, notice: 'wig was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @wig.update(wig_params)
      redirect_to @wig, notice: 'wig was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wig.destroy
    redirect_to wigs_url, notice: 'wig was successfully destroyed.'
  end

  def mywigs
    @wigs = Wig.where(owner: current_user)
    @rentals = WigRental.all
  end

  private

  def set_wig
    @wig = Wig.find(params[:id])
  end

  def wig_params
    params.require(:wig).permit(:color, :length, :owner_id, :price, :image_url, :title, :description, :photo)
  end
end
