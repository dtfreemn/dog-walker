class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :happiness
      t.integer :health

      t.timestamps
    end
  end
end
