class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.text :nome
      t.text :senha
      t.float :temperaturaIdeal

      t.timestamps null: false
    end
  end
end
