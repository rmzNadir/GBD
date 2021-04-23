class CreatePlanes < ActiveRecord::Migration[6.1]
  def change
    create_table :planes do |t|
      t.string :cod_avion, limit: 25
      t.string :modelo, limit: 25
      t.decimal :capacidad
      t.string :fabricante, limit: 25

      t.timestamps
    end
  end
end
