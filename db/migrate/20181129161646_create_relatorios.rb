class CreateRelatorios < ActiveRecord::Migration
  def change
    create_table :relatorios do |t|
      t.references :umidificador, index: true
      t.references :climatizador, index: true
      
      t.timestamps null: false
    end
  end
end
