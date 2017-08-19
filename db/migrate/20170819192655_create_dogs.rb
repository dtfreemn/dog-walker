class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.boolean :walk_need, :default => false
      t.integer :breed_id

      t.timestamps
    end
  end
end
