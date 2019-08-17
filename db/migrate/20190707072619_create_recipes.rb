class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredient
      t.string :how_to
      t.string :r_image
      t.string :kind
      t.integer :user_id

      t.timestamps
    end
  end
end
