class Admin::StaticPagesController < Admin::AdminBaseController
  before_action :is_admin?, only: :show

  def show; end
end
