class TravellingsController < ApplicationController
  # before_action :load_travelling, only: :show

  def index
    @travellings = Travelling.all.group(:location_end_id)
    @tours = Travelling.where(location_end_id: params[:location_end_id])
  end

  # private
  # def load_travelling
  #   @travelling = Travelling.find_by id: params[:id]
  # end
end
