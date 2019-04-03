class SendEmailJob < ApplicationJob
  queue_as :default

  def perform booking
    @booking = booking
    BookingMailer.booking_email(@booking).deliver_later
  end
end
