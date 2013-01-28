class CreateFaceballs < ActiveRecord::Migration
  def change
    create_table :faceballs do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
