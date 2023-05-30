class PagesController < ApplicationController
  def home
    @wigs = Wig.all
  end

  def log_in
    @user = User.find(:email, :password)
  end
end
