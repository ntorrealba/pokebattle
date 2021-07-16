class PokemonsController < ApplicationController

  def index
    @pokemons = PokemonApi.all
  end

  def show
    id = params["id"]
    @pokemon = PokemonApi.id(id)
  end

end
