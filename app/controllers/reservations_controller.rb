class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def preload
    club = Club.find(params[:club_id])
    today = Date.today
    reservations = club.reservations.where("play_date >= ?", today)

    render json: reservations
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to @reservation.club, notice: "Votre réservation a été acceptée"
  end

  def your_inscriptions
    @inscriptions = current_user.reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:play_date, :club_id)
  end

end
