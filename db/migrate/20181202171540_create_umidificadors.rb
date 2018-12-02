class CreateUmidificadors < ActiveRecord::Migration
  def change
    create_table :umidificadors do |t|
      t.float :umidade
      t.integer :usuario_id
      t.text :historico

      t.timestamps null: false
    end
  end
end
