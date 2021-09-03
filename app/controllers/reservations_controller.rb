class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def preload
    club = Club.find(params[:club_id])
    today = Date.today
    reservations = club.reservations.where("play_date >= ?", today)

    render json: reservations
  end

  def preview
      play_date = Date.parse(params[:play_date])
      output = {
          conflict: is_conflict(play_date)
      }

      render json: output
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
    AppMailer.new_reservation(Club.find(@reservation.club_id), @reservation).deliver_now
    redirect_to @reservation.club, notice: "Votre réservation a été acceptée"
    end
  end

  def your_inscriptions
    @inscriptions = current_user.reservations
  end

  def your_reservations
    @clubs = current_user.clubs
  end

  private
  def reservation_params
    params.require(:reservation).permit(:play_date, :club_id)
  end

  def is_conflict(play_date)
     club = Club.find(params[:room_id])
     check = club.reservations.where("? < play_date", play_date)
     check.size > 0 ? true : false
  end
end
