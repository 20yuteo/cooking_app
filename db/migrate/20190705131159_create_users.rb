class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :password
      t.string :email
      t.string :u_image
      t.string :like_recipe_id

      t.timestamps
    end
  end
end
