class AddRadiusToUser < ActiveRecord::Migration
  def change
    add_column :users, :radius, :int
  end
end
