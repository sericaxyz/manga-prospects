class DropCommnet < ActiveRecord::Migration[5.2]
  def change
    drop_table :commnets
  end
end
