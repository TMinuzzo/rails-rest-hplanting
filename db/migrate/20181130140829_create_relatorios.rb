class CreateRelatorios < ActiveRecord::Migration
  def change
    create_table :relatorios do |t|

      t.timestamps null: false
    end
  end
end
