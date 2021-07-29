class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @pokemons = PokemonApi.all
  end

  def show
    if @pokemon.nil?
      @pokemon = PokemonApi.find(params[:id])
    else
      @pokemon = Pokemon.find_by(id: params[:id])
    end
  end

  def create
    pokemon = Pokemon.new(pokemons_params)
    # @pokemon = Pokemon.new(pokemons_params)

    respond_to do |format|
      if pokemon.save
        format.html { }
        format.json
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @pokemon = Pokemon.new
  end

  private

  def pokemons_params
    params.require(:pokemon).permit(:name, :level, :number, :types, :height, :weight, :abilities, :moves, :base_states, :user_id)
  end

end
