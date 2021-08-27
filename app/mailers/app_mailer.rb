class AppMailer < ActionMailer::Base

  def new_reservation(club, reservation)
    @user = User.find(club.user_id)
    @reservation = reservation
    @club = club
    mail(from: 'Passbad <no-reply@passbad.com', to: @user.email, subject: "Nouvelle réservation!" )
  end
  
end
