class CreateSavedVideos < ActiveRecord::Migration
  def change
    create_table :saved_videos do |t|
      t.references :video,  null: false
      t.references :user,   null: false
    end

    add_index :saved_videos, [:user_id, :video_id], unique: true

    add_foreign_key :saved_videos, :users, on_delete: :cascade
    add_foreign_key :saved_videos, :videos, on_delete: :restrict
  end
end
