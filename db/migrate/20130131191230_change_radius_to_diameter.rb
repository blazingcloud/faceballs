class ChangeRadiusToDiameter < ActiveRecord::Migration
  def up
    remove_column :users, :radius
    add_column :users, :diameter, :int, :default => 60
  end

  def down
    remove_column :users, :diameter, :int, :default => 60
    add_column :users, :radius, :int
  end
end
