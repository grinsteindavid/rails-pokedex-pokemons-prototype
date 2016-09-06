class UserMailer < ApplicationMailer
  def new_user(user)
    @user = user
    mail to: @user.email, subject: "You have been successfully registered"
  end

  def new_user_notification(user)
    @user = user
    mail to: 'davmir.pokedex.app@gmail.com', subject: "New registered user: #{user.username.capitalize}"
  end

  def new_pokemon(user, pokemon)
    @user = user
    @pokemon = pokemon
    mail to: @user.email, subject: "You have created a new Pokemon: #{pokemon.name.capitalize}"
  end

  def new_pokemon_notification(user, pokemon)
    @user = user
    @pokemon = pokemon
    mail to: 'davmir.pokedex.app@gmail.com', subject: "#{user.username.capitalize} created a new Pokemon: #{pokemon.name}"
  end
end
