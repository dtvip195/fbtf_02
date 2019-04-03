class BookingMailer < ApplicationMailer
  def booking_email booking
    @booking = booking
    mail to: booking.user.email, subject: t("booking_success")
  end
end
