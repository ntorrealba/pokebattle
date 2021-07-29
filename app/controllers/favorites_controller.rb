class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user)
    @pokemons = []
    @favorites.each do |favorite|
      @pokemons << Pokemon.find_by(id: favorite.pokemon_id)
    end
  end

  def create
    @user = current_user
    @pokemon = Pokemon.find_by(number: params[:number], user_id: @user)
    if @pokemon.nil?
      pokemon = PokemonApi.find(params[:number])
      pokemon_new = pokemon.new_pokemon(current_user)
      @pokemon = pokemon_new
    end
    @favorite = @user.favorites.build(pokemon_id: @pokemon.id, number: params[:number] )

    # @pokemon = PokemonApi.find(params[:pokemon_id])
    respond_to do |format|
      if @user.favorites.count == 6
        flash[:alert] = "Solo puede seleccionar 6 favoritos"
        format.html { redirect_to pokemon_path(@pokemon.number) }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      else
        @favorite.save
        format.html { redirect_to pokemon_path(@pokemon.number), notice: "Favorite was successfully created." }
        format.json { render :show, status: :created, location: @favorite }
      end
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id], user_id: current_user, number: params[:number])

    if @favorite.destroy
      respond_to do |format|
      format.html { redirect_to pokemon_path(params[:number]), notice: "Favorite was successfully destroyed." }
      format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to favorites_url, notice: "Favorite was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end
end
