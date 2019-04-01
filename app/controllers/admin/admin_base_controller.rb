class Admin::AdminBaseController < ApplicationController
  layout "admin_application"

  def check_admin
    return if current_user.admin?
    flash[:danger] = t "permission_denide"
    redirect_to root_path
  end

  def check_permission
    return unless user_signed_in?
    check_admin
  end
end
