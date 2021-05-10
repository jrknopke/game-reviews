class DropGenre < ActiveRecord::Migration[6.1]
  def down
    drop_table :genres
  end
end
