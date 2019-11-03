class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.integer :billing

      t.timestamps
    end
  end
end
