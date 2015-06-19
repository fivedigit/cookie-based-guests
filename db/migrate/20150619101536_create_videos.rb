class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
