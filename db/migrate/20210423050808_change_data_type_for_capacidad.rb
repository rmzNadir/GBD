class ChangeDataTypeForCapacidad < ActiveRecord::Migration[6.1]
  def self.up
    change_table :planes do |t|
      t.change :capacidad, :integer
    end
  end
  def self.down
    change_table :planes do |t|
      t.change :capacidad, :decimal
    end
  end
end
