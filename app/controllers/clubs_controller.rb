class ClubsController < ApplicationController

before_action :set_club, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
before_action :require_same_user, only: [:edit, :update]

  def index
    @clubs = current_user.clubs
  end

  def new
    @club = current_user.clubs.build
  end

  def create
    @club = current_user.clubs.build(club_params)
    if @club.save
      if params[:images]
        params[:images].each do |i|
          @club.photos.create(image: i)
        end
      end
      @photos = @club.photos
      redirect_to edit_club_path(@club), notice:"Votre club a été créé avec Succès"
    else
      render :new
    end
  end

  def show
    @photos = @club.photos
  end

  def edit
    @photos = @club.photos
  end

  def update
    if @club.update(club_params)
      if params[:images]
        params[:images].each do |i|
          @club.photos.create(image: i)
        end
      end
      @photos = @club.photos
      redirect_to edit_club_path(@club), notice:"Modification enregistrée"
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

  def require_same_user
    if current_user.id != @club.user_id
      flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
      redirect_to root_path
    end
  end

end
