class Admin::AdminBaseController < ApplicationController
  layout "admin_application"

  def is_admin?
    return if user_signed_in? && current_user.admin?
    flash[:danger] = t "permission_denide"
    redirect_to root_path
  end
end
