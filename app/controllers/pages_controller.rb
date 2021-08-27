class PagesController < ApplicationController

  def home
    @clubs = Club.order("RANDOM()").limit(3)
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:passbad_search] = params[:search]
    end


    arrResult = Array.new

    if session[:passbad_search] && session[:passbad_search] != ""
      @clubs_address = Club.where(active: true).near(session[:passbad_search], 40, order:'distance')
    else
      @clubs_address = Club.where(active: true).all
    end

    @search = @clubs_address.ransack(params[:q])
    @clubs = @search.result

    @arrClubs = @clubs.to_a

    if(params[:play_date] && !params[:play_date].empty?)
      play_date = Date.parse(params[:play_date])

      @clubs.each do |club|
        not_available = club.reservations.where("(? <= play_date AND play_date <= ?)", play_date, play_date).limit(1)

        if not_available.length > 0
          @arrClubs.delete(club)
        end
      end
    end
  end
end
