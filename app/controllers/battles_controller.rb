class BattlesController < ApplicationController

  def index
    @pokemon = current_user.pokemons.find_by(number: params[:number] )

    respond_to do |format|
      format.html
      format.json
    end
  end
end