class AddPokemonUser < ActiveRecord::Migration
  def change
    add_reference :pokemons, :user, foreign_key: true, index: true
  end
end
