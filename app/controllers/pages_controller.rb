class PagesController < ApplicationController
  def home
    @wigs = Wig.all
  end
end
