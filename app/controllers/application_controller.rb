class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || wigs_path
  end
  before_action :authenticate_user!
end
