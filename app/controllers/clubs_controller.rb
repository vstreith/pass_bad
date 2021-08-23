class ClubController < ApplicationController

before_action :set_club, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]

  def index
    @clubs = current_user.clubs
  end

  def new
    @club = current_user.clubs.build
  end

  def create
    @club = current_user.clubs.build(club_params)
    if @club.save
      redirect_to @club, notice:"Votre club a été créé avec Succès"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @club.update(club_params)
      redirect_to @club, notice:"Modification enregistrée"
    else
      render :edit
    end
  end

private
  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:club_name, :summary, :address, :court_number, :place_number, :training_monday, :training_tuesday, :training_wednesday, :training_thusday, :training_friday, :training_saturday, :training_sunday,
    :player_ranking_n, :player_ranking_r, :player_ranking_d, :player_ranking_pnc, :is_coach, :active, :ffbad_affiliated)
  end

end
