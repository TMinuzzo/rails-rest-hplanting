class CreateUmidificadors < ActiveRecord::Migration
  def change
    create_table :umidificadors do |t|
      t.float :umidade
      t.text :historico

      t.timestamps null: false
    end
  end
end
