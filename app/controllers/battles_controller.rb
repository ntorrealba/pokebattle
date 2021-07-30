class BattlesController < ApplicationController

  def index
    @pokemon = current_user.pokemons.find_by(number: params[:number] )
    number = rand(1..200)
    @game = PokemonApi.find(number)

    respond_to do |format|
      format.html
      format.json
    end
  end
end