class WigsController < ApplicationController
  before_action :set_wig, only: %i[show edit update destroy]

  def index
    @wigs = Wig.all
  end

  def show
  end

  def new
    @wig = Wig.new
  end

  def create
    @user = User.find(params[:owner_id])
    @wig.owner = @user
    @wig = Wig.new(wig_params)
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

  private

  def set_wig
    @wig = Wig.find(params[:id])
  end

  def wig_params
    params.require(:wig).permit(:color, :length, :owner_id)
  end
end
