class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.integer :hp, null: false
      t.string :image
      t.timestamps null: false
    end
  end
end
