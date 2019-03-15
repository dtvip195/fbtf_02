class ToursController < ApplicationController

  def index
    @travels = Travelling.paginate(page: params[:page], :per_page => 10)
  end
end
