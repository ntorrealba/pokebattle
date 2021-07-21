class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.nil?
      respond_to do |format|
        format.html
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    else
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to pokemons_path }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.nil?
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    end

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to pokemons_path }
        format.json { render :create}
      end
    else
      respond_to do |format|
        flash.alert  = @user.errors.full_messages
        format.html { render :edit }
        format.json { render :create}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  private

    def user_params
      params.require(:user).permit(:name, :last_name, :email)
    end
end
