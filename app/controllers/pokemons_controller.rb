class PokemonsController < ApplicationController
  before_action :logged_in?, :set_user

  def index
    @pokemons = @user.pokemons
  end

  def show
    @pokemon = @user.pokemons.find(params[:id])
  end

  def new
    @pokemon = @user.pokemons.new
  end

  def create
    @pokemon = @user.pokemons.new(pokemon_params)
    if @pokemon.save
      UserMailer.new_pokemon(@user, @pokemon).deliver_now
      UserMailer.new_pokemon_notification(@user, @pokemon).deliver_now
      redirect_to "/users/#{@user.id}/pokemons/#{@pokemon.id}"
    else
      render 'new'
    end
  end

  def edit
    @pokemon = @user.pokemons.find(params[:id])
  end

  def update
    @pokemon = @user.pokemons.find(params[:id])
    @pokemon.image = nil
    if @pokemon.update(pokemon_params)
      redirect_to "/users/#{@user.id}/pokemons/#{@pokemon.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @pokemon = @user.pokemons.find(params[:id])
    @pokemon.image = nil
    @pokemon.destroy

    redirect_to "/users/#{@user.id}/pokemons"
  end

  def search
    @pokemon = @user.pokemons.find_by_name(params[:name].downcase)
    render "show"
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :hp, :image, :user_id)
  end

  def set_user
    @user = current_user
  end
end
