class CreateClimatizadors < ActiveRecord::Migration
  def change
    create_table :climatizadors do |t|
      t.float :temperatura

      t.timestamps null: false
    end
  end
end
