class Admin::AdminBaseController < ApplicationController
  layout "admin_application"

  before_action :is_admin?

  def is_admin?
    return if current_user.try :admin?
    flash[:danger] = t "permission_denide"
    redirect_to root_path
  end
end
