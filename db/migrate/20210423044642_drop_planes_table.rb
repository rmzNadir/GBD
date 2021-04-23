class DropPlanesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :planes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
