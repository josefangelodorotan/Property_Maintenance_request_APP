class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # protected

  def after_sign_in_path_for(resource)
    authenticated_root_path # Or any other path
  end
end

#ang original ay walang laman ang class method
