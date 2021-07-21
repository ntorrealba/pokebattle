class PokemonsController < ApplicationController

  def index
    @pokemons = PokemonApi.all
  end

  def show
    id = params["id"]
    @pokemon = PokemonApi.find(id)
  end

  def create
    @pokemon_new = Pokemon.new(pokemons_params)

    respond_to do |format|
      if @pokemon_new.save
        format.html { }
        format.json { render :show, status: :created, location: @pokemon_new }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon_new.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def pokemons_params
    params.require(:pokemon).permit(:name, :wight, :hability, :user_id)
  end

end
