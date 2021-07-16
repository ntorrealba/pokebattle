class PokemonsController < ApplicationController

  def index
    @pokemons = PokemonApi.all
  end

  def show
    id = params["id"]
    @pokemon = PokemonApi.find(id)
  end

end
