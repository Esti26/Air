class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @wigs = Wig.all
  end

  def log_in
    @user = User.find(:email, :password)
  end
  
end
