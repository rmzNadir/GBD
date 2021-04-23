class RemoveCodAvionFromPlanes < ActiveRecord::Migration[6.1]
  def change
    remove_column :planes, :cod_avion, :string, limit: 25
  end
end
